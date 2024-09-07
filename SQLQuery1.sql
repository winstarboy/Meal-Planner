SET IDENTITY_INSERT [dbo].[Table] ON;

INSERT INTO [dbo].[Table] ([ID], [Name], [Email], [Password], [Confirm_Password], [isAdmin])
VALUES (3, 'Kewin', 'kewin@gmail.com', 'querty', 'querty', 1);

SET IDENTITY_INSERT [dbo].[Table] OFF;
