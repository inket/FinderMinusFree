//
//  main.m
//  FinderMinusFree
//
//  Created by inket on 4/9/13.
//
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSString* plistPath = @"/System/Library/CoreServices/Finder.app/Contents/Resources/English.lproj/Localizable.strings";
        NSString* plistBackupPath = @"/System/Library/CoreServices/Finder.app/Contents/Resources/English.lproj/Localizable_backup.strings";
        NSString* newValue = (argc > 1) ? [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding] : @", ^0";

        NSFileManager* manager = [NSFileManager defaultManager];
        if ([manager isWritableFileAtPath:plistPath])
        {
            // Backup
            [manager copyItemAtPath:plistPath toPath:plistBackupPath error:nil];
            
            // Replace value
            NSMutableDictionary* infoDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
            [infoDict setObject:newValue forKey:@"IN_9"];
            [infoDict writeToFile:plistPath atomically:NO];
            [manager setAttributes:[NSDictionary dictionaryWithObject:[NSDate date] forKey:NSFileModificationDate] ofItemAtPath:plistPath error:nil];
            
            // Kill Finder to apply the changes
            NSLog(@"Done. Killing Finder.");
            system("killall Finder");
        }
        else
        {
            NSLog(@"File is not writable. Try again with sudo.");
        }
    }
    return 0;
}

