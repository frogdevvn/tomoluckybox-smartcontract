pragma solidity ^0.5.0;

contract TomoLuckyBox {
  uint constant LUCKY_BOX_1 = 1000;
  uint constant LUCKY_BOX_2 = 2000;
  uint constant LUCKY_BOX_3 = 3000;

  uint constant RESULT_WIN = 1;
  uint constant RESULT_LOSE = 0;

  uint nonce = 0;

  event LogRandomLuckyBoxSuccessed(address indexed _addressSender, uint _valueReturn, uint _idLuckyBoxReturn,uint _amountPrize);

  function randomLuckyBox(uint idBoxSender)
    external
    payable
  {
    uint randomNumber = random();
    uint idLuckyBox = 0;
    if(randomNumber >= 1 && randomNumber <= 3)
      idLuckyBox = LUCKY_BOX_1;
    else
      if(randomNumber >= 4 && randomNumber <= 6)
        idLuckyBox = LUCKY_BOX_2;
      else
        idLuckyBox = LUCKY_BOX_3;
    if(idLuckyBox == idBoxSender) {
      uint amountPrize = msg.value * 3;
      sendPayment(msg.sender, amountPrize);
      emit LogRandomLuckyBoxSuccessed(msg.sender, RESULT_WIN, idLuckyBox, amountPrize);
    }
    else {
      emit LogRandomLuckyBoxSuccessed(msg.sender, RESULT_LOSE, idLuckyBox, 0);
    }
  }

  //WARNING: THIS RANDOM FUNCTION IS NOT SECURITY, DON'T USE IT IN PRODUCTION MODE
  //YOU CAN IMPLEMENT SECURE RANDOM  USE RANDAO OR COMMIT-REVEAL SCHEMA
  function random() internal returns (uint) {
    uint randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty, nonce))) % 9;
    randomNumber = randomNumber + 1;
    nonce++;
    return randomNumber;
  }

  function sendPayment(address payable _receiverAdress, uint _amount) private {
      _receiverAdress.transfer(_amount);
  }

}
