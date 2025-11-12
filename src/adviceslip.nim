import asyncdispatch, httpclient, json, strutils
const api = "https://api.adviceslip.com"
var headers = newHttpHeaders({
    "Connection": "keep-alive",
    "user-agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36",
    "Host": "api.adviceslip.com",
    "accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7"
})

proc random_advice*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/advice")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc advice_by_id*(slip_id:int): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/advice/" & $slip_id)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc search_advice*(query:string): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers 
  try:
    let response = await client.get(api & "/advice/search/" & query)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
