// Complete the Sui browser learning
// - The `Hello Move` contract must include your GitHub ID and output the content as `github id`
// - Submit the `version ID` of `Sui CLI`
// - Submit the `package id` of the deployed `Hello Move` contract
// - Submit a screenshot of the installed browser wallet to the `images` folder

module hello::message {
    use std::string;
    use sui::object::{Self, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    // Define the Message struct that will store the GitHub ID
    struct Message has key, store {
        id: UID,
        github_id: string::String
    }

    // Initialize function that creates and shares a Message object
    public fun init(ctx: &mut TxContext) {
        let message = Message {
            id: object::new(ctx),
            github_id: string::utf8(b"manolaz")
        };
        
        // Transfer the message object to the sender
        transfer::public_share_object(message);
    }

    // Function to get the GitHub ID
    public fun get_github_id(message: &Message): &string::String {
        &message.github_id
    }

    // Function to update the GitHub ID
    public entry fun update_github_id(
        message: &mut Message,
        new_github_id: vector<u8>,
        _ctx: &mut TxContext
    ) {
        message.github_id = string::utf8(new_github_id);
    }
}

