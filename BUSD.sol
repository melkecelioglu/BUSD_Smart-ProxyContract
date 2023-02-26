// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBUSDImplementation {
    function initialize() external;
    function getOwner() external view returns (address);
    function totalSupply() external view returns (uint256);
    function transfer(address _to, uint256 _value) external returns (bool);
    function balanceOf(address _addr) external view returns (uint256);
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool);
    function approve(address _spender, uint256 _value) external returns (bool);
    function allowance(address _owner, address _spender) external view returns (uint256);
    function proposeOwner(address _proposedOwner) external;
    function disregardProposeOwner() external;
    function claimOwnership() external;
    function pause() external;
    function unpause() external;
    function isFrozen(address _addr) external view returns (bool);
    function setAssetProtectionRole(address _newAssetProtectionRole) external;
    function freeze(address _addr) external;
    function unfreeze(address _addr) external;
    function wipeFrozenAddress(address _addr) external;
    function setSupplyController(address _newSupplyController) external;
    function increaseSupply(uint256 _value) external returns (bool);
    function decreaseSupply(uint256 _value) external returns (bool);
    function nextSeqOf(address target) external view returns (uint256);
    function betaDelegatedTransfer(
        bytes calldata sig, address to, uint256 value, uint256 fee, uint256 seq, uint256 deadline
    ) external returns (bool);
    function betaDelegatedTransferBatch(
        bytes32[] calldata r, bytes32[] calldata s, uint8[] calldata v, address[] calldata to, uint256[] calldata value, uint256[] calldata fee, uint256[] calldata seq, uint256[] calldata deadline
    ) external returns (bool);
    function isWhitelistedBetaDelegate(address _addr) external view returns (bool);
    function whitelistBetaDelegate(address _addr) external;
    function unwhitelistBetaDelegate(address _addr) external;
}

contract BUSDProxy {
    IBUSDImplementation public implementation;
    address public owner;

    constructor(address _implementation) payable{
        implementation = IBUSDImplementation(_implementation);
        owner = msg.sender;
    }

    function initialize() public {
        implementation.initialize();
    }

    function getOwner() public view returns (address) {
        return implementation.getOwner();
    }

    function totalSupply() public view returns (uint256) {
        return implementation.totalSupply();
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        return implementation.transfer(_to, _value);
    }

    function balanceOf(address _addr) public view returns (uint256) {
        return implementation.balanceOf(_addr);
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
        return implementation.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value) public returns (bool) {
        return implementation.approve(_spender, _value);
    }

    function allowance(address _owner, address _spender) public view returns (uint256) {
        return implementation.allowance(_owner, _spender);
    }

    function proposeOwner(address _proposedOwner) public {
        implementation.proposeOwner(_proposedOwner);
    }

    function disregardProposeOwner() public {
        implementation.disregardProposeOwner();
    }

    function pause() public {
        implementation.pause();
    }

    function unpause() public {
        implementation.unpause();
    }

    function claimOwnership() public {
        implementation.claimOwnership();
    }

    function isFrozen (address _addr) public view returns (bool) {
        return implementation.isFrozen(_addr);
    }
    
    function setAssetProtectionRole(address _newAssetProtectionRole) public {
    implementation.setAssetProtectionRole(_newAssetProtectionRole);
}

function freeze(address _addr) public {
    implementation.freeze(_addr);
}

function unfreeze(address _addr) public {
    implementation.unfreeze(_addr);
}

function wipeFrozenAddress(address _addr) public {
    implementation.wipeFrozenAddress(_addr);
}

function setSupplyController(address _newSupplyController) public {
    implementation.setSupplyController(_newSupplyController);
}

function increaseSupply(uint256 _value) public returns (bool) {
    return implementation.increaseSupply(_value);
}

function decreaseSupply(uint256 _value) public returns (bool) {
    return implementation.decreaseSupply(_value);
}

function nextSeqOf(address target) public view returns (uint256) {
    return implementation.nextSeqOf(target);
}

function betaDelegatedTransfer(
    bytes calldata sig, address to, uint256 value, uint256 fee, uint256 seq, uint256 deadline
) public returns (bool) {
    return implementation.betaDelegatedTransfer(sig, to, value, fee, seq, deadline);
}


function isWhitelistedBetaDelegate(address _addr) public view returns (bool) {
    return implementation.isWhitelistedBetaDelegate(_addr);
}

function whitelistBetaDelegate(address _addr) public {
    implementation.whitelistBetaDelegate(_addr);
}

function unwhitelistBetaDelegate(address _addr) public {
    implementation.unwhitelistBetaDelegate(_addr);
}

}
