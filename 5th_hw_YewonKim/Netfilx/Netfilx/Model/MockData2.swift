//
//  MockData2.swift
//  Netfilx
//
//  Created by yewoni on 4/7/24.
//
//  MockData2 is for search page and search detail modal page

import UIKit

struct MockData2{
    var title: String
    var movieImage: String
    // detail 페이지에 추가적으로 필요한 정보들
    var year: Int
    var movieDescription: String
    var EpisodeList: Array<String>
    var EpisodeDescription: Array<String>
}

extension MockData2{
    static var modeling = [
        [
            MockData2(title: "Avatar",
                      movieImage: "avatar",
                      year: 2022,
                      movieDescription: "A paraplegic Marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.",
                      EpisodeList: ["Avatar1 (2009)", "Avatar2 (2022)"],
                      EpisodeDescription: ["The humans interact with a humanoid species called the Na'vi by inhabiting genetically engineered “avatar” bodies that resemble those of the Na'vi.", "Jake and Natiri, who lived happily in a family, are forced to leave their home to explore the Pandora's regions. Meanwhile, soon after humans storm and threaten Pandora again, Jake is in an uncomfortable war with his relatives."]
                     )
        ],
        [
            MockData2(title: "Spider man",
                      movieImage: "spider",
                      year: 2023,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode", "Fifth Episode", "Sixth Episode", "Seventh Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. ",
                                           "As Emily delves deeper into the enigma of Whispering Pines, she unravels a tapestry of love, loss, and redemption that transcends time and space.",
                                           "Guided by an ancient prophecy and fueled by her unyielding spirit, Emily must confront her fears and embrace her destiny amidst the whispers of the pines.",
                                           "This captivating tale of mystery and magic will capture your imagination and leave you yearning for more. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. "
                                          ]
                     )
        ],
        [
            MockData2(title: "The Setup", 
                      movieImage: "the-setup",
                      year: 2024,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode", "Fifth Episode", "Sixth Episode", "Seventh Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.",
                                           "As Emily delves deeper into the enigma of Whispering Pines, she unravels a tapestry of love, loss, and redemption that transcends time and space.",
                                           "Guided by an ancient prophecy and fueled by her unyielding spirit, Emily must confront her fears and embrace her destiny amidst the whispers of the pines.",
                                           "This captivating tale of mystery and magic will capture your imagination and leave you yearning for more. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
        ],
        [
            MockData2(title: "Breaking Bad", 
                      movieImage: "breaking-bad",
                      year: 2002,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
            
        ],
        [
            MockData2(title: "Ozark", 
                      movieImage: "ozark",
                      year: 2020,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
        ],
        [
            MockData2(title: "The Governor", 
                      movieImage: "the-governor",
                      year: 2020,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode", "Fifth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem.",
                                           "As Emily delves deeper into the enigma of Whispering Pines, she unravels a tapestry of love, loss, and redemption that transcends time and space."
                                          ]
                     )
        ],
        [
            MockData2(title: "Your Excellency",
                      movieImage: "your-excellency",
                      year: 2022,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
        ],
        [
            MockData2(title: "Citation", 
                      movieImage: "Citation",
                      year: 2022,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
        ],
        [
            MockData2(title: "Oloture", 
                      movieImage: "oloture",
                      year: 2023,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
        ],
        [
            MockData2(title: "The Setup", 
                      movieImage: "the-setup",
                      year: 2024,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
        ],
        [
            MockData2(title: "Breaking Bad", 
                      movieImage: "breaking-bad",
                      year: 2002,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
        ],
        [
            MockData2(title: "Ozark", 
                      movieImage: "ozark",
                      year: 2020,
                      movieDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                      EpisodeList: ["First Episode", "Second Episode", "Third Episode", "Fourth Episode"],
                      EpisodeDescription: ["Set against the backdrop of a city plagued by a mysterious series of disappearances, Jack finds himself entangled in a web of deceit and danger.",
                                           "In the enchanting world of 'Whispering Pines,' a young artist named Emily embarks on a transformative journey of self-discovery in a quaint coastal town.",
                                           "Drawn by the allure of its picturesque landscapes and mysterious legends, Emily finds herself uncovering the town's hidden secrets while grappling with her own inner turmoil.",
                                           "Along the way, she encounters a cast of eccentric locals, each harboring their own stories and desires. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem."
                                          ]
                     )
        ]
    ]
}
