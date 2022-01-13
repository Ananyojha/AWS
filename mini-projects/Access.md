IAM policy account B

```

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*"
            ],
            "Resource": [
                "arn:aws:s3:::test-bucket",
                "arn:aws:s3:::test-bucket/*",
                "arn:aws:s3:us-east-1:AccountA:accesspoint/test-ap",
                "arn:aws:s3:us-east-1:AccountA:accesspoint/test-ap/*"
            ]
        }
    ]
}
```
Bucket policy account A

```

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "*",
            "Resource": [
                "arn:aws:s3:::test-bucket",
                "arn:aws:s3:::test-bucket/*"
            ],
            "Condition": {
                "StringEquals": {
                    "s3:DataAccessPointAccount": "AccountA"
                }
            }
        }
    ]
}
```

Access point policy

```

{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "AllowListFolderToIamUser",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam:AccountB:user/UserInAccountB"
            },
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:us-east-1:AccountA:accesspoint/test-ap",
            "Condition": {
                "StringLike": {
                    "s3:prefix": "public/*"
                }
            }
        },
        {
            "Sid": "AllowReadAccessToIamUser",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::user/UserInAccountB"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:us-east-1:AccountA:accesspoint/test-ap/object/public/*"
        }
    
}
```
