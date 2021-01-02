//
//  ProductsService.swift
//  DesafioAfroDev
//
//  Created by Luan Pizzamiglio Audibert on 11/18/20.
//
import Foundation

protocol ProductsServiceProtocol {
    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}

class ProductsService: ProductsServiceProtocol {
    
    var urlString = "https://private-8f4dda-testeabi.apiary-mock.com/produtos"

    func getProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "", code: 404, userInfo: nil)))
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"

        let session = URLSession.shared.dataTask(with: urlRequest) { data, response, err in

            let httpResponse = response as? HTTPURLResponse
            let statusCode = httpResponse?.statusCode ?? 400

            guard let data = data else {
                let error = NSError(domain: "Data not sent or response", code: statusCode, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }

            if let error = err as NSError? {
                if error.code != NSURLErrorCancelled {
                    DispatchQueue.main.async { completion(.failure(error)) }
                }
                return
            }

            guard let response = httpResponse, 200..<300 ~= response.statusCode else {
                let error = NSError(domain: "Data not sent or response is not in the range [200,299]", code: statusCode, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }

            guard let decodedData = try? JSONDecoder().decode([Product].self, from: data) else {
                let error = NSError(domain: "Error while decoding the result", code: 0, userInfo: nil)
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }
            DispatchQueue.main.async { completion(.success(decodedData)) }
        }
        session.resume()

    }
}
