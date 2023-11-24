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
#test1.1# spotify_token fonksiyonunu çağırarak değişkeni oluştur
spotify_token <- spotify_token()
# Örnek bir spotify_token fonksiyonu
spotify_token <- function() {
  # Fonksiyonun içeriği buraya gelecek
}

# Test 1.2 - spotify_token adlı değişkenin tipi “function” olmalı
test_1_2 <- is.function(spotify_token)

# Test 1.3 - spotify_token() çağrıldığında döndürdüğü çıktı bir liste olmalı
result <- spotify_token()
test_1_3 <- is.list(result)

# Test 1.4 - spotify_token() çağrıldığında döndürdüğü listenin iki elementi olmalı
test_1_4 <- length(result) == 2

# Test sonuçlarını kontrol etme
test_1_2
test_1_3
test_1_4
