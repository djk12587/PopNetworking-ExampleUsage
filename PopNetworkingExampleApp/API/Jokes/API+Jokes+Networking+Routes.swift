//
//  API+Jokes+Networking+Routes.swift
//  howToUse
//
//  Created by Dan Koza on 2/14/21.
//

import Foundation
import PopNetworking

extension API {
    enum Jokes {}
}

extension API.Jokes {
    enum Routes {}
}

extension API.Jokes.Routes {
    struct GetJoke: JokesRoute {

        let path = "/jokes/random"
        let method: NetworkingRouteHttpMethod = .get
        let parameterEncoding: NetworkingRequestParameterEncoding = .url(params: nil)

        typealias ResponseSerializer = NetworkingResponseSerializers.DecodableResponseSerializer<Models.Jokes.Joke>
        let responseSerializer: ResponseSerializer

        init(mockResult: Result<ResponseSerializer.SerializedObject, Error>? = nil) {
            responseSerializer = ResponseSerializer(mockedResult: mockResult)
        }
    }

    struct GetTenJokes: JokesRoute {
        let path = "/jokes/ten"
        let method: NetworkingRouteHttpMethod = .get
        let parameterEncoding: NetworkingRequestParameterEncoding = .url(params: nil)

        typealias ResponseSerializer = NetworkingResponseSerializers.DecodableResponseSerializer<[Models.Jokes.Joke]>
        let responseSerializer = ResponseSerializer()
    }

    struct GetTenJokesMappableResponseModelExample: JokesRoute {
        let path = "/jokes/ten"
        let method: NetworkingRouteHttpMethod = .get
        let parameterEncoding: NetworkingRequestParameterEncoding = .url(params: nil)

        typealias ResponseSerializer = NetworkingResponseSerializers.MappableModelResponse<[Models.Jokes.JokeViewModel],
                                                                                           [Models.Jokes.Joke]>
        let responseSerializer = ResponseSerializer()
    }
}
