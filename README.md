## [Funding Congress](http://fundingcongress.com)

A place where you can find your legislators and discover where their top campaign
funding sources come from.

## API
A JSON API for looking up legislators by zipcode along with their top 5 campaign contributors organized by cycle.

### Using the API

`http://fundingcongress.com/api/v1/[method].json[options]`

### Methods

1. `legislators`

    Example usage:

    `http://fundingcongress.com/api/v1/legislators.json`

    Use this method with no additional options to see all legislators in the database.
    Please note, the database is not an exhaustive list of all legislators; legislators are pulled in as users of the site search for their zipcode.

    Add a zipcode option to the legislators method to see all legislators for that zipcode.

    Example usage:

    `http://fundingcongress.com/api/v1/legislators.json?zipcode=80203`
    Please note, if the legislators for that zipcode do not yet exist in the database, the request will take several seconds to pull all the data from the Sunlight APIs.

2. `legislators/:id`

    Example usage:

    `http://fundingcongress.com/api/v1/legislators/100.json`

    Use this method to see only one legislator along with its contributors.
