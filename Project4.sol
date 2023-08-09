// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts/access/Ownable.sol";     

contract DegenToken is ERC20("Degan", "DOGN"), Ownable {
    string public MyTokens = "" ; 

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address to, uint256 amount) external {
        _transfer(_msgSender(), to, amount);
    }

    function burnTokens(uint256 amount) external {
        _burn(_msgSender(), amount);
    }

    function store() public pure returns (string memory) {
        return
            "1. Naruto Headband = 500 \n 2. Madara Susano = 1200 \n 3. Fireball Punch = 300 \n 4. Itachi Sharingaan = 800  \n 5. Kurama 9 tailed Beast = 1000";
    }

    function redeemTokens(uint256 choice) external payable {
        require(choice >= 1 && choice <= 5, "Invalid selector");  

        uint256 value;  
        string memory tokenName; 

        if (choice == 1) {
            value = 1000;
            tokenName = "Chandigarh";
        } else if (choice == 2) {
            value = 2000;
            tokenName = "Mohali";
        } else if (choice == 3) {
            value = 3000;
            tokenName = "Panchkula";
        } else if (choice == 4) {
            value = 4000;
            tokenName = "Kharar";
        } else {
            value = 5000;
            tokenName = "Ambala";
        }

        require(balanceOf(_msgSender()) >= value, "Insufficient balance!!!!");
        _transfer(_msgSender(), owner(), value);

        MyTokens = string.concat(MyTokens,tokenName,", ");
    }
}
