import Foundation
import SwiftInfluxDBCore

struct HandlerID: Hashable {

	var label: String
	var type: String
	var tags: [String: String]

	init(label: String, type: String, dimensions: inout [(String, String)], labelsAsTags: LabelsSet) {
		tags = [:]
		self.label = label
		self.type = type
		var fields: [(String, String)] = []
		for (key, value) in dimensions {
			if labelsAsTags.contains(key, in: label) {
				tags[key] = value
			} else {
				fields.append((key, value))
			}
		}
		dimensions = fields
	}
}

struct HandlerIDNoTags: Hashable {
    
    var label: String
    var type: String
}
