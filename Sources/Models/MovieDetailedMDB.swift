//
//  MovieDetailedMDB.swift
//  MDBSwiftWrapper
//
//  Created by George Kye on 2016-02-16.
//  Copyright © 2016 George Kye. All rights reserved.
//

import Foundation

public struct belongstocollectionMovieMDB{
  public var id: Int!
  public var name: String!
  public var poster_path: String!
  public var backdrop_path: String!
  init(results: JSON){
    id = results["id"].int
    name = results["name"].string
    poster_path = results["poster_path"].string
    backdrop_path = results["backdrop_path"].string
  }
  
}
public struct SpokenLanguages{
  public var iso_639_1: String!
  public var name: String!
  init(results: JSON){
    iso_639_1 = results["iso_639_1"].string
    name = results["name"].string
  }
}

open class MovieDetailedMDB: MovieMDB {
  
  open var belongs_to_collection: belongstocollectionMovieMDB?
  open var budget: Int?
  open var homepage: String?
  open var imdb_id: Int!
  open var production_companies: [KeywordsMDB]?
  open var production_countries: [KeywordsMDB]?
  open var revenue : Int?
  open var runtime: Int?
  open var spoken_languages: [SpokenLanguages]?
  open var status: String!
  open var tagline: String!
  
  
  required public init(results: JSON) {
    super.init(results: results)
    belongs_to_collection = belongstocollectionMovieMDB(results: results["belongs_to_collection"])
    budget = results["budget"].int
    homepage = results["homepage"].string
    imdb_id = results["imdb_id"].int
    
    if(results["production_companies"].exists()){
        production_companies = results["production_companies"].map{
            KeywordsMDB.init(results: $0.1)
        }
    }
    
    if(results["production_countries"].exists()){
        production_countries = results["production_countries"].map{
            KeywordsMDB.init(results: $0.1)
        }
    }
    revenue = results["revenue"].int
    runtime = results["runtime"].int
    
    if(results["spoken_languages"].exists()){
        spoken_languages = results["spoken_languages"].map{
            SpokenLanguages.init(results: $0.1)
        }
    }
    status = results["status"].string
    tagline = results["tagline"].string
  }
  
  
}

