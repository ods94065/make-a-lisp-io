#!/usr/bin/env io

if(System args size > 1,
    # Run specific tests.
    System args slice(1) foreach(name,
        try(
            if(name endsWithSeq(".io"),
                Lobby doFile(System launchPath .. "/" ..  name)
            ,
                Lobby doString(name)
            )
        ) ?showStack
    )
    FileCollector run
,
    # Run all tests in the current directory.
    DirectoryCollector run
)
