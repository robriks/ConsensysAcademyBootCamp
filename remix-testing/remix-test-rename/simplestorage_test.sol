pragma solidity 0.8.0;
import "remix_tests.sol";
import "remix_accounts.sol";
import "./SimpleStorage.sol";

contract MyTest {
  SimpleStorage foo;

  function beforeEach() public {
    foo = new SimpleStorage();
  }
  /// #sender: account-0
  function initialValueShouldBe100() public returns (bool) {
    return Assert.equal(foo.get(), 100, "initial value is not correct");
  }

  /// #sender: account-1
  /// #value: 100
  function checkSenderAndValue() public payable {
      // account index varies 0-9, value is in wei
      Assert.equal(msg.sender, TestsAccounts.getAccount(1), "Invalid sender");
      Assert.equal(msg.value, 100, "Invalid value");
  }
}
