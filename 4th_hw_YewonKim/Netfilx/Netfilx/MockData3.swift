//
//  MockData3.swift
//  Netfilx
//
//  Created by yewoni on 4/9/24.
//
//  MockData3 is for coming soon page

import UIKit

struct MockData3{
    var title: String
    var movieImage: String
    var description: String
    var releaseDate: String
    var genreIds: [Int]
}

extension MockData3{
    static var modeling = [
        [
            MockData3(title: "Avatar: The Way of Water", movieImage: "avatar", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", releaseDate: "Season 2 Coming April 17", genreIds: [0, 1, 2, 3, 4, 5]),
        ],
        [
            MockData3(title: "Castle & Castle", movieImage: "castle&castle", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", releaseDate: "Season 1 Coming April 20", genreIds: [0, 1, 2, 3, 4, 5]),
        ],
        [
            MockData3(title: "Faster", movieImage: "faster", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ", releaseDate: "Season 1 Coming May 10", genreIds: [0, 1, 2, 3, 4, 5]),
        ]
    ]
}


