module hello::hello {
    // 完全限定路径写法（推荐）
    public struct Hello has key, store {
        id: sui::object::UID,
        message: std::ascii::String
    }

    #[ext(init)]
    fun init(ctx: &mut sui::tx_context::TxContext) {
        let hello = Hello {
            id: sui::object::new(ctx),
            message: std::ascii::string(b"Hello, Sui!")
        };
        sui::transfer::public_transfer(hello, sui::tx_context::sender(ctx));
    }
}
