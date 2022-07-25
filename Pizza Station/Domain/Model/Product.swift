

import Foundation
struct Product : Codable {
	let id : Int?
	let title : String?
	let description : String?
	let image : String?
	let category : String?
	let cook_time : String?
	let rating : Int?
	let ingredients : String?
	let sizes : [Sizes]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case title = "title"
		case description = "description"
		case image = "image"
		case category = "category"
		case cook_time = "cook_time"
		case rating = "rating"
		case ingredients = "ingredients"
		case sizes = "sizes"
	}


}
