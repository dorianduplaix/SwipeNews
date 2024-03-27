//
//  NewsFakeData.swift
//  SwipeNews
//
//  Created by Dorian Duplaix on 27/03/2024.
//

import Foundation

enum NewsAPIFakes {
    static var queryBitcoin = """
    {
    "status": "ok",
    "totalResults": 13748,
    "articles": [
    {
      "source": {
        "id": "wired",
        "name": "Wired"
      },
      "author": "Joel Khalili",
      "title": "What’s Behind the Bitcoin Price Surge? Vibes, Mostly",
      "description": "The price of bitcoin has climbed to a new all-time high. But assigning the cryptocurrency a value is anything but trivial.",
      "url": "https://www.wired.com/story/bitcoin-price-record-economics/",
      "urlToImage": "https://media.wired.com/photos/65ef46042ca08b0e59a9682f/191:100/w_1280,c_limit/031124-business-bitcoin-economics.jpg",
      "publishedAt": "2024-03-12T18:13:56Z",
      "content": "The latest surge in the price of bitcoin is increasing the clamor around it, says Dal Bianco, drawing in yet more speculators and creating a self-reinforcing cycle. Likewise, when collective confiden… [+2967 chars]"
    },
    {
      "source": {
        "id": "ars-technica",
        "name": "Ars Technica"
      },
      "author": "Ashley Belanger",
      "title": "Bitcoin price hits record $69K after SEC approvals fueled $7B in investments",
      "description": "SEC chair warns bitcoin is still",
      "url": "https://arstechnica.com/tech-policy/2024/03/bitcoin-price-hits-record-69k-after-sec-approvals-fueled-7b-in-investments/",
      "urlToImage": "https://cdn.arstechnica.net/wp-content/uploads/2024/03/GettyImages-1872368024-760x380.jpg",
      "publishedAt": "2024-03-05T19:07:13Z",
      "content": " sunk in 2022 amid a cryptocurrency"
    }
    ]
    }
    """.data(using: .utf8)
}
