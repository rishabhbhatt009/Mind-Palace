# Customizing Windows Terminal 

### Customizing the terminal prompt on windows and vscode integrated terminal 
- Customize terminal prompts using the Oh-My-Posh. 
	- Remember to find the profile location using "echo $PROFILE"
	- add the command there which execs on startup 
- Supports multiple themes 
- What I like in a theme :
	- git branch 
	- new line 
	- colors and icons 

#### adding conda env : 

```json
/// add conda env name to segments
{
  "foreground": "#FFE873",
  "leading_diamond": "\ue0b6",
  "style": "diamond",
  "properties": {
    "fetch_virtual_env": true,
    "display_mode": "environment",
    "home_enabled": true
  },
  "template": "\ue235 {{ if .Error }}{{ .Error }}{{ else }}{{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }}{{ end }}",
  "trailing_diamond": "\ue0b4 ",
  "type": "python"
}
```


Resources
- [How to make the ultimate Terminal Prompt on Windows 11](https://www.youtube.com/watch?v=VT2L1SXFq9U&ab_channel=ScottHanselman) 
- [Oh My Posh](https://ohmyposh.dev/)
- [Nerd Fonts](https://www.nerdfonts.com/#home)
