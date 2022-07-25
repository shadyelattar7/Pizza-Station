

import Foundation

struct Sizes : Codable {
    
	let id : Int?
	let size : String?
	let slices : Int?
	let price : Double?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case size = "size"
		case slices = "slices"
		case price = "price"
	}


}
