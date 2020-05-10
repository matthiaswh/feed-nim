import httpclient

type
    FetchError* = object of Exception
    ParseError* = object of Exception


proc raiseFetchError*(url: string, code: HttpCode) =
    raise newException(FetchError, "Failed to fetch feed " & url & ". Error code: " & $code)

proc raiseParseError*() =
  raise newException(ParseError, "Encountered an error while parsing feed.")
