//
//  ProductsViewModel.swift
//  Product
//
//  Created by Nikhil T on 18/05/23.
//

import Foundation
import Combine

class ProductsCatViewModel:ObservableObject {
    @Published var categories:[CategoryModel] = []
    @Published var error:CustomError?
    private var catSelections:[String] = []
    private let useCase:ProductCatUseCaseInterface
    private var cancellable:AnyCancellable?
    
    init(useCase:ProductCatUseCaseInterface) {
        self.useCase = useCase
    }
    
    convenience init(selections:[String],categories:[CategoryModel]) {
        self.init(useCase:UseCaseContainer.catUseCase())
        self.catSelections = selections
        self.categories = categories
    }
    
    func getSelectedCatList(id:String) -> [String] {
        catSelections.append(id)
        return catSelections
    }
    
    func isMainCategory() ->Bool{
        categories.count == 0
    }
    
    func getCategories() {
        cancellable = useCase.getCategories()
            .sink(receiveCompletion: { error in
                switch error {
                case .failure(let err) :
                    if let err = err as? CustomError {
                        self.error = err
                    }else {
                        self.error = CustomError(error: Errors.genericError)
                    }
                case .finished:
                    self.error = CustomError(error: Errors.genericError)
                }
            }, receiveValue: { catModel in
                self.categories = catModel.categories
            })
    }
}
