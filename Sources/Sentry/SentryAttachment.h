#import "SentryDefines.h"
#import "SentrySerializable.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * Adds additional information about what happened to an event.
 */
NS_SWIFT_NAME(Attachment)
@interface SentryAttachment : NSObject
SENTRY_NO_INIT

/**
 * Initializes SentryUserFeedback and sets the required eventId.
 *
 *
 */
- (instancetype)initWithData:(NSData *)data filename:(NSString *)filename;

- (instancetype)initWithData:(NSData *)data
                    filename:(NSString *)filename
                 contentType:(NSString *)contentType;

- (instancetype)initPath:(NSString *)path;

- (instancetype)initPath:(NSString *)path filename:(NSString *)filename;

/**
 * The data of the attachment.
 */
@property (readonly, nonatomic, strong) NSData *_Nullable data;

/**
 * The path of the attachment.
 */
@property (readonly, nonatomic, copy) NSString *_Nullable path;

/**
 * The filename of the attachment.
 */
@property (readonly, nonatomic, copy) NSString *filename;

/**
 * The content type of the attachment.
 */
@property (readonly, nonatomic, copy) NSString *contentType;

@end

NS_ASSUME_NONNULL_END
