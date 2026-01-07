# NotebookLM Cookie Extraction Guide

When the user needs to authenticate NotebookLM MCP, provide these instructions:

## Fastest Method: cURL Export

1. Open https://notebooklm.google.com (logged in)
2. Press `Cmd+Option+E` (opens DevTools directly in Network tab)
3. Press `Cmd+R` (reload page to generate requests)
4. Right-click any request to `notebooklm.google.com`
5. Select **Copy** → **Copy as cURL**
6. Paste the cURL command here

The cURL command contains all cookies including HttpOnly cookies (HSID, SSID) which are required for authentication.

## Important Notes

- `document.cookie` and bookmarklets do NOT work because HSID/SSID are HttpOnly cookies
- Tampermonkey also cannot access HttpOnly cookies
- The Network tab cURL export is the only reliable method

## After receiving the cURL command

Use the `save_auth_tokens` MCP tool with:
- `cookies`: Extract the cookie string from the `-b` or `--cookie` parameter
- `request_url`: The URL from the cURL command
- `request_body`: The `--data-raw` content if present

Then verify with `notebook_list` to confirm authentication works.
