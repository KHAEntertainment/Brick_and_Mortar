1. Endpoint to Send Data
After deployment, your agent will be available as an HTTP API endpoint. The exact URL will depend on your Toolhouse workspace and deployment settings, but it typically looks like:

POST https://api.toolhouse.ai/agents/{agent_id}/invoke
{agent_id} will be the unique identifier or slug for your deployed agent.
You can find the exact endpoint URL in your Toolhouse dashboard after deployment.

2. Request Format
Send a POST request with a JSON body. The body should include the fields as described in your agent’s message example. For your agent, a typical request body would look like:

{
  "message": "Product: Bambu Lab Polycarbonate (PC), White\nTimeout: 30"
}
You can also include a URL if you want to specify a product or category page:
{
  "message": "Product: Bambu Lab Polycarbonate (PC), White\nURL: https://www.matterhackers.com/store/c/bambu-lab-filament\nTimeout: 30"
}
3. Response Format
The agent will respond with a JSON object containing the following fields (when successful):

{
  "image_url": "https://example.com/path/to/image.jpg",
  "fallback_used": true,                // true if not from manufacturer, false if from manufacturer
  "confidence_score": 92,               // integer between 0-100
  "low_resolution": false               // true if <600x600px, false otherwise
}
If the agent cannot find a suitable image, it will return an error message, for example:
{
  "error": "Unable to find a suitable image of the Bambu Lab Polycarbonate (PC) filament spool that matches your requirements within the timeout."
}
4. Progress Updates
If your integration supports streaming or incremental updates, the agent can send progress messages as it works through each step. Otherwise, you’ll receive the final result as described above.

5. Summary Table
| Field | Type | Description | |-----------------|-----------|-----------------------------------------------------------------------------| | image_url | string | Direct URL to the selected product image | | fallback_used | boolean | true if image is from a distributor or open web, false if from manufacturer | | confidence_score| integer | 0-100, how sure the agent is about the match | | low_resolution | boolean | true if image is <600x600px, false otherwise | | error | string | Present only if no suitable image is found |

If you need the exact endpoint URL or want to see a sample cURL or Python request, let me know!

After you deploy your agent in Toolhouse, you’ll see its unique API endpoint in the Toolhouse dashboard. The endpoint will look like:

https://api.toolhouse.ai/agents/{agent_id}/invoke
{agent_id} is the unique identifier or slug for your agent, assigned by Toolhouse when you deploy it.
If you’re unsure of your agent’s ID, check the “Agents” section in your Toolhouse dashboard. The endpoint will be displayed there.
2. Example Endpoint
Suppose your agent’s ID is 3d-filament-image-finder.
Your endpoint would be:

https://api.toolhouse.ai/agents/3d-filament-image-finder/invoke
3. Example Request
POST to the endpoint with a JSON body:

{
  "message": "Product: Bambu Lab Polycarbonate (PC), White\nTimeout: 30"
}
cURL Example:

curl -X POST https://api.toolhouse.ai/agents/3d-filament-image-finder/invoke \
  -H "Content-Type: application/json" \
  -d '{"message": "Product: Bambu Lab Polycarbonate (PC), White\nTimeout: 30"}'
4. Example Response
Success:

{
  "image_url": "https://example.com/path/to/image.jpg",
  "fallback_used": true,
  "confidence_score": 92,
  "low_resolution": false
}
Failure:

{
  "error": "Unable to find a suitable image of the Bambu Lab Polycarbonate (PC) filament spool that matches your requirements within the timeout."
}
5. Where to Find the Endpoint
Log in to your Toolhouse dashboard.
Go to the “Agents” section.
Click on your agent (e.g., “3D Printer Filament Image Finder”).
The endpoint URL will be displayed at the top or in the API section.
If you provide your actual agent name or ID, I can show you the exact endpoint format. Otherwise, just replace {agent_id} with your agent’s actual ID from the dashboard.

Let me know if you need a sample in another language or more details!