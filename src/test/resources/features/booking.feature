Feature: Search on booking.com

  @Smoke
  Scenario: Search by city criteria
    Given User is looking for hotel in 'London' city
    When User does search
    Then Hotel 'Juzz Holiday Lets' should be on the first page

  Scenario: Found by city criteria hotel has correct rating
    Given User is doing search in 'London' city
    When User gets the 'Juzz Holiday Lets' hotel rating
    Then The rating of the hotel is '9,9'

  @Critical
  Scenario Outline: Search by different cities criteria
    Given User is looking for hotel in '<City>' city
    When User does search
    Then Hotel '<Hotel>' should be on the first page

    Examples:
      | City       | Hotel                                         |
      | London     | Juzz Holiday Lets                             |
      | Washington | The St Gregory Hotel Dupont Circle Georgetown |
      | Madrid     | Room Mate Alba                                |

    Scenario Outline: Found by different cities criteria hotels have correct rating
      Given User is doing search in '<City>' city
      When User gets the '<Hotel>' hotel rating
      Then The rating of the hotel is '<Rating>'

      Examples:
        | City       | Hotel                                         |Rating|
        | London     | Juzz Holiday Lets                             |9,9   |
        | Washington | The St Gregory Hotel Dupont Circle Georgetown |8,4   |
        | Madrid     | Room Mate Alba                                |9,3   |
