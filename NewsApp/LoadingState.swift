//
//  LoadingState.swift
//  NewsApp
//
//  Created by Matej Samaržija on 23.05.2026..
//


enum LoadingState<T> {
    case loading
    case success(T)
    case error(String)
}
