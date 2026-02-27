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

king_simulate :
	forge script script/King.s.sol \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

king:
	forge script ./script/King.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

reentrance_simulate:
	forge script script/ReEntrance.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

reentrance:
	forge script ./script/ReEntrance.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv	

elevator_simulate:
	forge script script/Elevator.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

elevator:
	forge script ./script/Elevator.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv	

privacy_simulate:
	forge script script/Privacy.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

privacy:
	forge script ./script/Privacy.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

gatekeeper_one_simulate:
	forge script script/GateKeeperOne.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

gatekeeper_one:
	forge script ./script/GateKeeperOne.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

gatekeeper_two_simulate:
	forge script script/GateKeeperTwo.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

gatekeeper_two:
	forge script ./script/GateKeeperTwo.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

naught_coin_simulate:
	forge script script/NaughtCoin.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

naught_coin:
	forge script ./script/NaughtCoin.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

preservation_simulate:
	forge script script/Preservation.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

preservation:
	forge script ./script/Preservation.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

recovery_simulate:
	forge script script/Recovery.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

recovery:
	forge script ./script/Recovery.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

magic_number_create_solver:
	cast send --rpc-url $$SEPOLIA_RPC_URL \
          --private-key $$PRIVATE_KEY \
          --create 600a600c600039600a6000f3602a60005260206000f3

magic_number_set_solver :
	forge script ./script/MagicNumber.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

alien_codex_simulate:
	forge script script/AlienCodex.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

alien_codex:
	forge script ./script/AlienCodex.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

denial :
	forge script ./script/Denial.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

shop_simulate:
	forge script script/Shop.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

shop:
	forge script ./script/Shop.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

dex_simulate:
	forge script script/Dex.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

dex:
	forge script ./script/Dex.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

dex2_simulate:
	forge script script/Dex2.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

dex2:
	forge script ./script/Dex2.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

puzzle_wallet_simulate:
	forge script script/PuzzleWallet.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

puzzle_wallet:
	forge script ./script/PuzzleWallet.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

motor_bike_simulate:
	forge script script/MotorBike.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

motor_bike:
	forge script ./script/MotorBike.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

double_entry_point_simulate:
	forge script script/DoubleEntryPoint.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

double_entry_point:
	forge script ./script/DoubleEntryPoint.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

good_samaritan_simulate:
	forge script script/GoodSamaritan.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

good_samaritan:
	forge script ./script/GoodSamaritan.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

gatekeeper_three_simulate:
	forge script script/GateKeeperThree.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

gatekeeper_three:
	forge script ./script/GateKeeperThree.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

switch_simulate:
	forge script script/Switch.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

switch:
	forge script ./script/Switch.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

higher_order_simulate:
	forge script script/HigherOrder.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

higher_order:
	forge script ./script/HigherOrder.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv

stake_simulate:
	forge script script/Stake.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

stake:
	forge script ./script/Stake.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv 

impersonator_simulate:
	forge script script/Impersonator.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

impersonator:
	forge script ./script/Impersonator.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv 

magic_animal_carousel_simulate:
	forge script script/MagicAnimalCarousel.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

magic_animal_carousel:
	forge script ./script/MagicAnimalCarousel.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv 

bet_house_simulate:
	forge script script/BetHouse.s.sol \
		--private-key $$PRIVATE_KEY \
		--fork-url $$SEPOLIA_RPC_URL \
		-vvvv

bet_house:
	forge script ./script/BetHouse.s.sol \
	--rpc-url $$SEPOLIA_RPC_URL \
	--private-key $$PRIVATE_KEY \
	--chain sepolia \
	--broadcast \
	-vvvv