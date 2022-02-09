![](https://general-immersionday-tmp.workshop.aws/images/security/policy.png)

## policy -
Version – Specify the version of the policy language that you want to use.

Statement – Container for the following elements:

Sid – Include an optional statement ID to differentiate between your statements.
Effect – Use Allow or Deny indicating whether the policy allows or denies access.
Principal – We will NOT use this element in this lab. The Principal element is used in resource policy statements to identify the Principal (account, user, role, or federated user) to which you would like to allow or deny access. This element is NOT used when creating IAM identity policies. In IAM identity policies the Principal is implied from the user or role that the policy is attached to.
Action – Include a list of actions that the policy allows or denies.
Resource – Specify a list of resources to which the actions apply.
Condition (Optional) – Specify the circumstances under which the policy grants permission.
If you want to define more than one permission for an entity (user, group, or role), you can use multiple statements in a single policy. You can also attach multiple policies to an IAM entity to manage access. For example, below is an example has two permission statements included in the policy that enable all DynamoDB actions against two tables located us-east-1 and us-west-2 regions in the AWS Account 123456789012.

```
{
"Version": "2012-10-17",
    "Statement": [
    {
     "Effect": "Allow",
     "Action": "dynamodb:*",
     "Resource": [ "arn:aws:dynamodb:us-east-1:123456789012:table/MyTestApp_DDB_Table" ]
    },
    {
     "Effect": "Allow",
     "Action": "dynamodb:*",
     "Resource": [ "arn:aws:dynamodb:us-west-2:123456789012:table/MyTestApp_DDB_Table" ]
    }
                 ]
}
```

Now lets create IAM --
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowDepartmentEC2Management",
            "Effect": "Allow",
            "Action": "ec2:*",
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "ec2:ResourceTag/department": "${aws:PrincipalTag/department}"
                }
            }
        },
        {
            "Sid": "AllowEC2DescribeAll",
            "Effect": "Allow",
            "Action": "ec2:Describe*",
            "Resource": "*"
        },
        {
            "Sid": "DenyTagManagement",
            "Effect": "Deny",
            "Action": [
                "iam:UntagUser",
                "iam:UntagRole",
                "ec2:DeleteTags",
                "ec2:CreateTags",
                "iam:TagRole",
                "iam:TagUser"
            ],
            "Resource": "*"
        }
    ]
}
```
he policy has 3 statements. When attached to an IAM entity these statements:

Allow the Principal (e.g. User) to execute all Elastic Compute Cloud (EC2) actions against EC2 instances which have the same department tag as the Principal attempting to perform the action.
Allow the Principal (e.g. User) to describe all EC2 instances within the AWS account.
Explicitly deny the Principal (e.g. User) access to manipulate IAM or EC2 tags within the AWS account.
```
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Action": "sts:AssumeRole",
    "Resource": "*",
    "Condition": {"StringLike": {"iam:ResourceTag/contractors-assume-role": "true"}}
  }
}
```

Contracter Assume role -- contractors-assume-role : true 
