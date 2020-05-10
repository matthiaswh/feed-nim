import httpclient

import FeedNim/atom
import FeedNim/rss
import FeedNim/jsonfeed
import FeedNim/exceptions


proc loadAtom*(filename: string): Atom = ## Loads the Atom from the given ``filename``.
    var Atom: string = readFile(filename) # Load the data from the file.
    return parseAtom(Atom)


proc getAtom*(url: string): Atom = ## Gets the Atom over from the specified ``url``.
    var response = newHttpClient().get(url)
    if response.code() != Http200:
        raiseFetchError(url, response.code())
    var Atom: string = response.body # Get the data.
    return parseAtom(Atom)


proc loadRSS*(filename: string): Rss = ## Loads the RSS from the given ``filename``.
    var rss: string = readFile(filename) # Load the data from the file.
    return parseRSS(rss)


proc getRSS*(url: string): Rss = ## Gets the RSS over from the specified ``url``.
    var response = newHttpClient().get(url)
    if response.code() != Http200:
        raiseFetchError(url, response.code())
    var rss: string = response.body # Get the data.
    return parseRSS(rss)

proc loadJsonFeed*(filename: string): JsonFeed = ## Loads the JSONFeed from the given ``filename``.
    var jsonFeed: string = readFile(filename) # Load the data from the file.
    return parseJSONFeed(jsonFeed)


proc getJsonFeed*(url: string): JsonFeed = ## Gets the JSONFeed over from the specified ``url``.
    var response = newHttpClient().get(url)
    if response.code() != Http200:
        raiseFetchError(url, response.code())
    var jsonFeed: string = response.body # Get the data.
    return parseJSONFeed(jsonFeed)
