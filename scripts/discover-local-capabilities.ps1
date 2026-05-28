$ErrorActionPreference = "Stop"

function Read-SkillMetadata {
  param(
    [string]$Root
  )

  if (-not (Test-Path -LiteralPath $Root)) {
    return @()
  }

  Get-ChildItem -LiteralPath $Root -Directory | ForEach-Object {
    $skillFile = Join-Path $_.FullName "SKILL.md"
    if (-not (Test-Path -LiteralPath $skillFile)) {
      return
    }

    $text = Get-Content -LiteralPath $skillFile -Raw
    $name = $_.Name
    $description = ""

    if ($text -match "(?m)^name:\s*(.+)$") {
      $name = $Matches[1].Trim().Trim('"')
    }

    if ($text -match "(?ms)^description:\s*(.+?)(?:\r?\n[a-zA-Z_-]+:|\r?\n---)") {
      $description = $Matches[1].Trim().Trim('"').Replace("`r", " ").Replace("`n", " ")
    }

    [PSCustomObject]@{
      type = "skill"
      source = $Root
      name = $name
      folder = $_.Name
      path = $skillFile
      description = $description
    }
  }
}

function Read-PluginMetadata {
  param(
    [string]$Root
  )

  if (-not (Test-Path -LiteralPath $Root)) {
    return @()
  }

  Get-ChildItem -LiteralPath $Root -Recurse -Filter plugin.json -Force | ForEach-Object {
    try {
      $json = Get-Content -LiteralPath $_.FullName -Raw | ConvertFrom-Json
      [PSCustomObject]@{
        type = "plugin"
        name = $json.name
        version = $json.version
        path = $_.FullName
        root = $_.Directory.Parent.FullName
      }
    } catch {
      [PSCustomObject]@{
        type = "plugin"
        name = $_.Directory.Parent.Name
        version = ""
        path = $_.FullName
        root = $_.Directory.Parent.FullName
      }
    }
  }
}

function Read-McpMetadata {
  param(
    [string]$ConfigPath
  )

  if (-not (Test-Path -LiteralPath $ConfigPath)) {
    return @()
  }

  $items = @()
  $current = $null

  foreach ($line in Get-Content -LiteralPath $ConfigPath) {
    if ($line -match "^\s*\[mcp_servers\.([A-Za-z0-9_-]+)\]\s*$") {
      if ($current) {
        $items += $current
      }
      $current = [ordered]@{
        type = "mcp"
        name = $Matches[1]
        config = $ConfigPath
        command = ""
        args = ""
        transport = ""
        url = ""
      }
      continue
    }

    if (-not $current) {
      continue
    }

    if ($line -match "^\s*command\s*=\s*(.+)$") {
      $current.command = $Matches[1].Trim()
    } elseif ($line -match "^\s*args\s*=\s*(.+)$") {
      $current.args = $Matches[1].Trim()
    } elseif ($line -match "^\s*transport\s*=\s*(.+)$") {
      $current.transport = $Matches[1].Trim()
    } elseif ($line -match "^\s*url\s*=\s*(.+)$") {
      $current.url = $Matches[1].Trim()
    }
  }

  if ($current) {
    $items += $current
  }

  $items | ForEach-Object { [PSCustomObject]$_ }
}

$inventory = [ordered]@{
  generated_at = (Get-Date).ToString("s")
  skills = @(
    Read-SkillMetadata "C:\Users\xxloo\.codex\skills"
    Read-SkillMetadata "C:\Users\xxloo\.agents\skills"
    Read-SkillMetadata "C:\Users\xxloo\.codex\skills\.system"
  )
  plugins = @(Read-PluginMetadata "C:\Users\xxloo\.codex\plugins\cache")
  mcp = @(Read-McpMetadata "C:\Users\xxloo\.codex\config.toml")
}

$inventory | ConvertTo-Json -Depth 6
