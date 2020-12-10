#import "SentryAttachment.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NSString *const DefaultContentType = @"application/octet-stream";

@implementation SentryAttachment

- (instancetype)initWithData:(NSData *)data filename:(NSString *)filename
{
    return [self initWithData:data filename:filename contentType:DefaultContentType];
}

- (instancetype)initWithData:(NSData *)data
                    filename:(NSString *)filename
                 contentType:(NSString *)contentType
{

    if (self = [super init]) {
        _data = data;
        _filename = filename;
        _contentType = contentType;
    }
    return self;
}

- (instancetype)initPath:(NSString *)path
{
    return [self initPath:path filename:[_path lastPathComponent]];
}

- (instancetype)initPath:(NSString *)path filename:(NSString *)filename
{
    if (self = [super init]) {
        _path = path;
        _filename = filename;
        _contentType = DefaultContentType;
    }
    return self;
}

@end

NS_ASSUME_NONNULL_END
