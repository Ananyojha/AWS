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
