Feature: Card Service Story
  Testing 2 method represent finding by regex and delete by list.

  Scenario Outline: The user has created three cleaning todo cards, wrote them in the database. Then he searched for them based on regex
    Given User create cards with description about <desc>, <desc2>, <desc3>
    And save them in database
    When user wants find card with descriptions about <regex>
    Then service returned cards with description contains <word>

    Examples:
      | desc             | desc2            | desc3  | regex       | word |
      |'vacuum the carpet' |'clean the bathroom'|'wash car'|'(^.*clean.*$)'|'clean'|


  Scenario Outline: The user has created a list of 4 cards and then save them to the database. In the meantime, added two cards to remove.
  when he decided to remove it, the service should remove only two cards and leave the rest of the cards saved in db

    Given User create cards with equals: <id> <id2> <id3> <id4>
    And save them in database
    And user create list with two cards to remove <id5> <id6>
    When user remove cards by list cards to remove
    Then database not contains list cards to remove
    And size elements in database is <size>

    Examples:
      | id | id2 | id3 | id4 | id5 | id6 | size |
      | 1  | 2   | 3   | 4   | 2   | 3   | 2    |