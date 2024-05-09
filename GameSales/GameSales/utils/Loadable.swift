enum Loadable<T> {
    case loading
    case failure(Error)
    case success(T)
}
