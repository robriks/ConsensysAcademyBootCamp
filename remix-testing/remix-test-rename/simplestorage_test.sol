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
      address seller = TestsAccounts.getAccount(1);
      // account index varies 0-9, value is in wei
      Assert.equal(msg.sender, seller, "Invalid sender");
      Assert.equal(msg.value, 100, "Invalid value");
  }

  function setInFoo() public {
    /// #sender: account-2
    foo.set(69);

    address setter = TestsAccounts.getAccount(2);

    Assert.notEqual(msg.sender, setter, "didnt work");
  }
}
