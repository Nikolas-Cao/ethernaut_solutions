.PHONY: deploy-sepolia simulate-sepolia

telephone_simulate:
	forge script script/Telephone.s.sol \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

telephone:
	forge script ./script/Telephone.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

token_simulate:
	forge script script/Token.s.sol \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

token:
	forge script ./script/Token.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

delegation_simulate:
	forge script script/Delegate.s.sol \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

delegation:
	forge script ./script/Delegate.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

force_simulate:
	forge script script/Force.s.sol \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

force:
	forge script ./script/Force.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

vault_simulate:
	forge script script/Vault.s.sol \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

vault:
	forge script ./script/Vault.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv