//
//  NetworkConstant.swift
//  Movietranding
//
//  Created by Abdulbosid Jalilov on 10/08/23.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //Singletone
    }
    
    public var apiKey: String {
        get {
            //API key from //https://www.themoviedb.org/
            return "8618ef462c1d9873128b33cc811c2789"
        }
    }
    
    public var severAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
