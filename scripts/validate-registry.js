const fs = require("fs");
const path = require("path");

const root = path.resolve(__dirname, "..");
const registryPath = path.join(root, "registry", "capabilities.json");
const allowedTypes = new Set([
  "skill",
  "plugin",
  "mcp",
  "workflow",
  "agent",
  "prompt",
  "template",
  "doc",
]);
const allowedStatus = new Set(["candidate", "draft", "stable", "deprecated"]);
const allowedImportStrategy = new Set(["imported", "reference", "index-only"]);

function fail(message) {
  console.error(`ERROR: ${message}`);
  process.exitCode = 1;
}

function readJson(filePath) {
  try {
    return JSON.parse(fs.readFileSync(filePath, "utf8"));
  } catch (error) {
    fail(`cannot read JSON ${path.relative(root, filePath)}: ${error.message}`);
    return null;
  }
}

const registry = readJson(registryPath);
if (!registry) {
  process.exit(1);
}

if (!Array.isArray(registry.capabilities)) {
  fail("registry.capabilities must be an array");
  process.exit(1);
}

const seen = new Set();

for (const capability of registry.capabilities) {
  const label = capability.id || capability.name || "<unknown>";

  for (const field of ["id", "type", "name", "path", "status", "tags"]) {
    if (!(field in capability)) {
      fail(`${label}: missing required field ${field}`);
    }
  }

  if (typeof capability.id === "string") {
    if (!/^[a-z0-9][a-z0-9._-]*$/.test(capability.id)) {
      fail(`${label}: id must use lowercase letters, numbers, dot, dash, or underscore`);
    }
    if (seen.has(capability.id)) {
      fail(`${label}: duplicate id`);
    }
    seen.add(capability.id);
  }

  if (!allowedTypes.has(capability.type)) {
    fail(`${label}: unsupported type ${capability.type}`);
  }

  if (!allowedStatus.has(capability.status)) {
    fail(`${label}: unsupported status ${capability.status}`);
  }

  if (
    "import_strategy" in capability &&
    !allowedImportStrategy.has(capability.import_strategy)
  ) {
    fail(`${label}: unsupported import_strategy ${capability.import_strategy}`);
  }

  if (!Array.isArray(capability.tags)) {
    fail(`${label}: tags must be an array`);
  }

  if (typeof capability.path === "string" && capability.status !== "candidate") {
    const resolved = path.resolve(root, capability.path);
    if (!resolved.startsWith(root)) {
      fail(`${label}: path must stay inside repository`);
    } else if (!fs.existsSync(resolved)) {
      fail(`${label}: path does not exist: ${capability.path}`);
    }
  }

  if ("upstream" in capability) {
    const upstream = capability.upstream;
    if (!upstream || typeof upstream !== "object" || Array.isArray(upstream)) {
      fail(`${label}: upstream must be an object`);
    } else {
      for (const field of ["repo", "path", "commit", "last_checked"]) {
        if (typeof upstream[field] !== "string" || upstream[field].trim() === "") {
          fail(`${label}: upstream.${field} must be a non-empty string`);
        }
      }
    }
  }
}

if (process.exitCode) {
  process.exit(process.exitCode);
}

console.log(`OK: ${registry.capabilities.length} capabilities validated.`);
