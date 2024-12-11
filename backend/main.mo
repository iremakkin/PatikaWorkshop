import Map "mo:base/HashMap";
import Text "mo:base/Text";

actor Phonebook{

  type Name = Text;
  type Phone = Text;

  type Entry =  {
    desc: Text;
    phone: Phone;
  };
  type Message = {
    receiver: Text;
    message: Text;
  };
  
  let phoneBook = Map.HashMap<Name, Entry>(0, Text.equal, Text.hash);
  let messageHistory = Map.HashMap<Phone, Message>(0, Text.equal, Text.hash);

  public func Insert(name: Name, entry: Entry): async(){
    phoneBook.put(name, entry);
  };

  public query func GetPhone(name: Name): async ?Entry{
    phoneBook.get(name);
  };

  public func SendMessage(senderPhone: Phone, message: Message): async(){
    messageHistory.put(senderPhone, message);
  };

  public query func SentMessages(senderPhone: Phone): async ?Message{
    messageHistory.get(senderPhone);
  };

}
