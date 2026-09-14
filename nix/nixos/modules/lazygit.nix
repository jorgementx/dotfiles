{ config, pkgs, ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      gui.showIcons = true;
      services = {
        "trumpf.ghe.com" = "github:trumpf.ghe.com";
      };
      customCommands = [
        {
          key = "C";
          command = "cz commit";
          description = "Commit with commitizen";
          context = "files";
          loadingText = "Opening commitizen";
          output = "terminal";
        }
        {
          key = "B";
          command = "cz bump";
          description = "Bump version with commitizen";
          context = "files";
          loadingText = "Opening commitizen";
          output = "terminal";
        }
        {
          key = "I";
          command = "cz init";
          description = "Initialize commitizen";
          context = "files";
          loadingText = "Opening commitizen";
          output = "terminal";
        }
        {
          key = "<a-o>";          
          context = "global";
          description = "Copy PR info to clipboard & open Teams";
          loadingText = "Fetching PR details from GitHub...";
          command = ''pr_json=$(gh pr view --json title,url); if [ -z "$pr_json" ]; then echo "Error: No PR found for this branch."; exit 1; fi; b64=$(printf "%s" "$pr_json" | base64 -w0); powershell.exe -STA -NoProfile -Command "\$pr = [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String('$b64')) | ConvertFrom-Json; \$text = '👀 ' + \$pr.title + ' (' + \$pr.url + ')' + [Environment]::NewLine + '🕵️ @work-preparation-core'; \$title = [Net.WebUtility]::HtmlEncode([string]\$pr.title); \$url = [Net.WebUtility]::HtmlEncode([string]\$pr.url); \$html = '<div>👀 <a href="' + \$url + '">' + \$title + '</a><br>🕵️ @work-preparation-core</div>'; Add-Type -AssemblyName PresentationCore; \$data = New-Object System.Windows.DataObject; \$data.SetData([System.Windows.DataFormats]::UnicodeText, \$text); \$data.SetData([System.Windows.DataFormats]::Html, \$html); [System.Windows.Clipboard]::SetDataObject(\$data, \$true)"; powershell.exe -NoProfile -Command 'Start-Process "https://teams.microsoft.com"' '';
        }
      ];
    };
  };
}
