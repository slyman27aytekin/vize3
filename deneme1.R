library(httr)

spotify_token <- function() {
  # Spotify API'ye gönderilecek isteğin URL'si
  auth_url <- "https://accounts.spotify.com/BURADATOKENVAAAR"
  
  # Spotify API'ye gönderilecek isteğin body kısmı
  body_data <- list(
    grant_type = "client_credentials"
  )
  
  # Spotify API'ye isteği gönderme
  response <- POST(
    auth_url,
    add_headers(
      Authorization = "Basic YOUR_BASE64_ENCODED_CLIENT_ID_AND_SECRET"
    ),
    body = body_data,
    encode = "form"
  )
  
  # HTTP status kodunu alma
  status_code <- status_code(response)
  
  # Token'i alma ve Bearer ile birleştirme
  token <- paste("Bearer", content(response)$access_token, sep = " ")
  
  # Sonuçları liste olarak döndürme
  result <- list(
    status_code = status_code,
    token = token
  )
  
  return(result)
}
