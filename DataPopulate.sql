USE [CyberDayMaster]
GO
SET IDENTITY_INSERT [dbo].[Coordinator] ON 
GO
INSERT [dbo].[Coordinator] ([CoordinatorID], [Name], [Email], [Phone]) VALUES (1, N'Tony Stark', N'stark@me.org', 5555545)
GO
INSERT [dbo].[Coordinator] ([CoordinatorID], [Name], [Email], [Phone]) VALUES (2, N'Steve Rodgers', N'rodgers@me.org', 5555558)
GO
SET IDENTITY_INSERT [dbo].[Coordinator] OFF
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'0987', N'Volunteer', 1)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'1010', N'Student', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'1111', N'Student', 1)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'1234', N'EventContact', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'2222', N'Volunteer', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'5678', N'Instructor', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'abcd', N'EventContact', 1)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'efgh', N'Instructor', 1)
GO
SET IDENTITY_INSERT [dbo].[Event] ON 
GO
INSERT [dbo].[Event] ([EventID], [Date], [Name], [Room]) VALUES (1, CAST(N'2020-10-29T00:00:00.000' AS DateTime), N'CyberDay 1', NULL)
GO
INSERT [dbo].[Event] ([EventID], [Date], [Name], [Room]) VALUES (2, CAST(N'2020-11-10T00:00:00.000' AS DateTime), N'CyberDay 2', NULL)
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
INSERT [dbo].[EventContact] ([EventID], [ContactCode], [Name], [OrganizationID], [Phone], [Email]) VALUES (2, N'1234', N'Clark Kent', 2, 5555588, N'kent@me.org')
GO
INSERT [dbo].[EventContact] ([EventID], [ContactCode], [Name], [OrganizationID], [Phone], [Email]) VALUES (1, N'abcd', N'Bruce Wayne', 1, 5555555, N'wayne@me.org')
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 
GO
INSERT [dbo].[Organization] ([OrganizationID], [Name], [Type], [ContactCode]) VALUES (1, N'Johnson Middle School', N'School', N'abcd')
GO
INSERT [dbo].[Organization] ([OrganizationID], [Name], [Type], [ContactCode]) VALUES (2, N'Collegiate School', N'School', N'1234')
GO
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
INSERT [dbo].[Instructor] ([InstructorCode], [Name], [OrganizationID], [Email], [Phone], [ContactCode]) VALUES (N'5678', N'John Deer', 2, N'deer@me.org', 5558888, N'1234')
GO
INSERT [dbo].[Instructor] ([InstructorCode], [Name], [OrganizationID], [Email], [Phone], [ContactCode]) VALUES (N'efgh', N'Peter Parker', 1, N'Parker@me.org', 5554444, N'abcd')
GO
INSERT [dbo].[Cluster] ([ClusterCode], [InstructorCode], [OrganizationID]) VALUES (N'1111', N'efgh', 1)
GO
INSERT [dbo].[Cluster] ([ClusterCode], [InstructorCode], [OrganizationID]) VALUES (N'1010', N'5678', 2)
GO
INSERT [dbo].[Volunteer] ([VolunteerCode], [Name], [Role], [OrganizationID], [Phone], [Email]) VALUES (N'0987', N'Mary Lamb', N'Student', 1, 5552233, N'Lamb@me.org')
GO
INSERT [dbo].[Volunteer] ([VolunteerCode], [Name], [Role], [OrganizationID], [Phone], [Email]) VALUES (N'2222', N'Jacob Smith', N'Parent', 2, 5556644, N'Smith@me.org')
GO
INSERT [dbo].[CoordinatorAuth] ([CoordinatorID], [Username], [Password]) VALUES (1, N'Stark', N'1111')
GO
INSERT [dbo].[CoordinatorAuth] ([CoordinatorID], [Username], [Password]) VALUES (2, N'Steve', N'1111')
GO
SET IDENTITY_INSERT [dbo].[EventActivities] ON 
GO
INSERT [dbo].[EventActivities] ([EventID], [ActivityID], [ActivityName], [Time], [Room], [ActivityGuideID]) VALUES (1, 1, N'JavaScript', CAST(N'09:00:00' AS Time), 200, 1)
GO
INSERT [dbo].[EventActivities] ([EventID], [ActivityID], [ActivityName], [Time], [Room], [ActivityGuideID]) VALUES (1, 2, N'Database Management', CAST(N'11:00:00' AS Time), 211, 1)
GO
INSERT [dbo].[EventActivities] ([EventID], [ActivityID], [ActivityName], [Time], [Room], [ActivityGuideID]) VALUES (2, 3, N'Python', CAST(N'09:00:00' AS Time), 212, 2)
GO
INSERT [dbo].[EventActivities] ([EventID], [ActivityID], [ActivityName], [Time], [Room], [ActivityGuideID]) VALUES (2, 4, N'Visual Studio', CAST(N'11:00:00' AS Time), 222, 2)
GO
SET IDENTITY_INSERT [dbo].[EventActivities] OFF
GO
INSERT [dbo].[EventVolunteers] ([VolunteerCode], [EventID]) VALUES (N'0987', 1)
GO
INSERT [dbo].[EventVolunteers] ([VolunteerCode], [EventID]) VALUES (N'2222', 2)
GO
INSERT [dbo].[Student] ([StudentCode], [Name], [InstructorCode], [Notes], [OrganizationID]) VALUES (N'1111', N'Max Vaughan', N'efgh', N'Smart Cookie', 1)
GO
INSERT [dbo].[Student] ([StudentCode], [Name], [InstructorCode], [Notes], [OrganizationID]) VALUES (N'1010', N'Barry Allen', N'5678', N'Happy', 2)
GO
INSERT [dbo].[Student] ([StudentCode], [Name], [InstructorCode], [Notes], [OrganizationID]) VALUES (N'1111', N'Lebron James', N'efgh', N'Athletic', 1)
GO
INSERT [dbo].[Student] ([StudenGO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'2222', N'Volunteer', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'5678', N'Instructor', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'abcd', N'EventContact', 1)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'efgh', N'Instructor', 1)
GO
SET IDENTITY_INSERT [dbo].[Event] ON 
GO
INSERT [dbo].[Event] ([EventID], [Date], [Name], [Room]) VALUES (1, CAST(N'2020-10-29T00:00:00.000' AS DateTime), N'CyberDay 1', NULL)
GO
INSERT [dbo].[Event] ([EventID], [Date], [Name], [Room]) VALUES (2, CAST(N'2020-11-10T00:00:00.000' AS DateTime), N'CyberDay 2', NULL)
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
INSERT [dbo].[EventContact] ([EventID], [ContactCode], [Name], [OrganizationID], [Phone], [Email]) VALUES (2, N'1234', N'Clark Kent', 2, 5555588, N'kent@me.org')
GO
INSERT [dbo].[EventContact] ([EventID], [ContactCode], [Name], [OrganizationID], [Phone], [Email]) VALUES (1, N'abcd', N'Bruce Wayne', 1, 5555555, N'wayne@me.org')
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 
GO
INSERT [dbo].[Organization] ([OrganizationID], [Name], [Type], [ContactCode]) VALUES (1, N'Johnson Middle School', N'School', N'abcd')

USE [CyberDayMaster]
GO
SET IDENTITY_INSERT [dbo].[Coordinator] ON 
GO
INSERT [dbo].[Coordinator] ([CoordinatorID], [Name], [Email], [Phone]) VALUES (1, N'Tony Stark', N'stark@me.org', 5555545)
GO
INSERT [dbo].[Coordinator] ([CoordinatorID], [Name], [Email], [Phone]) VALUES (2, N'Steve Rodgers', N'rodgers@me.org', 5555558)
GO
SET IDENTITY_INSERT [dbo].[Coordinator] OFF
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'0987', N'Volunteer', 1)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'1010', N'Student', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'1111', N'Student', 1)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'1234', N'EventContact', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'2222', N'Volunteer', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'5678', N'Instructor', 2)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'abcd', N'EventContact', 1)
GO
INSERT [dbo].[AccessCode] ([Code], [UserType], [CoordinatorID]) VALUES (N'efgh', N'Instructor', 1)
GO
SET IDENTITY_INSERT [dbo].[Event] ON 
GO
INSERT [dbo].[Event] ([EventID], [Date], [Name], [Room]) VALUES (1, CAST(N'2020-10-29T00:00:00.000' AS DateTime), N'CyberDay 1', NULL)
GO
INSERT [dbo].[Event] ([EventID], [Date], [Name], [Room]) VALUES (2, CAST(N'2020-11-10T00:00:00.000' AS DateTime), N'CyberDay 2', NULL)
GO
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
INSERT [dbo].[EventContact] ([EventID], [ContactCode], [Name], [OrganizationID], [Phone], [Email]) VALUES (2, N'1234', N'Clark Kent', 2, 5555588, N'kent@me.org')
GO
INSERT [dbo].[EventContact] ([EventID], [ContactCode], [Name], [OrganizationID], [Phone], [Email]) VALUES (1, N'abcd', N'Bruce Wayne', 1, 5555555, N'wayne@me.org')
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 
GO
INSERT [dbo].[Organization] ([OrganizationID], [Name], [Type], [ContactCode]) VALUES (1, N'Johnson Middle School', N'School', N'abcd')
GO
INSERT [dbo].[Organization] ([OrganizationID], [Name], [Type], [ContactCode]) VALUES (2, N'Collegiate School', N'School', N'1234')
GO
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
INSERT [dbo].[Instructor] ([InstructorCode], [Name], [OrganizationID], [Email], [Phone], [ContactCode]) VALUES (N'5678', N'John Deer', 2, N'deer@me.org', 5558888, N'1234')
GO
INSERT [dbo].[Instructor] ([InstructorCode], [Name], [OrganizationID], [Email], [Phone], [ContactCode]) VALUES (N'efgh', N'Peter Parker', 1, N'Parker@me.org', 5554444, N'abcd')
GO
INSERT [dbo].[Cluster] ([ClusterCode], [InstructorCode], [OrganizationID]) VALUES (N'1111', N'efgh', 1)
GO
INSERT [dbo].[Cluster] ([ClusterCode], [InstructorCode], [OrganizationID]) VALUES (N'1010', N'5678', 2)
GO
INSERT [dbo].[Volunteer] ([VolunteerCode], [Name], [Role], [OrganizationID], [Phone], [Email]) VALUES (N'0987', N'Mary Lamb', N'Student', 1, 5552233, N'Lamb@me.org')
GO
INSERT [dbo].[Volunteer] ([VolunteerCode], [Name], [Role], [OrganizationID], [Phone], [Email]) VALUES (N'2222', N'Jacob Smith', N'Parent', 2, 5556644, N'Smith@me.org')
GO
INSERT [dbo].[CoordinatorAuth] ([CoordinatorID], [Username], [Password]) VALUES (1, N'Stark', N'1111')
GO
INSERT [dbo].[CoordinatorAuth] ([CoordinatorID], [Username], [Password]) VALUES (2, N'Steve', N'1111')
GO
SET IDENTITY_INSERT [dbo].[EventActivities] ON 
GO
INSERT [dbo].[EventActivities] ([EventID], [ActivityID], [ActivityName], [Time], [Room], [ActivityGuideID]) VALUES (1, 1, N'JavaScript', CAST(N'09:00:00' AS Time), 200, 1)
GO
INSERT [dbo].[EventActivities] ([EventID], [ActivityID], [ActivityName], [Time], [Room], [ActivityGuideID]) VALUES (1, 2, N'Database Management', CAST(N'11:00:00' AS Time), 211, 1)
GO
INSERT [dbo].[EventActivities] ([EventID], [ActivityID], [ActivityName], [Time], [Room], [ActivityGuideID]) VALUES (2, 3, N'Python', CAST(N'09:00:00' AS Time), 212, 2)
GO
INSERT [dbo].[EventActivities] ([EventID], [ActivityID], [ActivityName], [Time], [Room], [ActivityGuideID]) VALUES (2, 4, N'Visual Studio', CAST(N'11:00:00' AS Time), 222, 2)
GO
SET IDENTITY_INSERT [dbo].[EventActivities] OFF
GO
INSERT [dbo].[EventVolunteers] ([VolunteerCode], [EventID]) VALUES (N'0987', 1)
GO
INSERT [dbo].[EventVolunteers] ([VolunteerCode], [EventID]) VALUES (N'2222', 2)
GO
INSERT [dbo].[Student] ([StudentCode], [Name], [InstructorCode], [Notes], [OrganizationID]) VALUES (N'1111', N'Max Vaughan', N'efgh', N'Smart Cookie', 1)
GO
INSERT [dbo].[Student] ([StudentCode], [Name], [InstructorCode], [Notes], [OrganizationID]) VALUES (N'1010', N'Barry Allen', N'5678', N'Happy', 2)
GO
INSERT [dbo].[Student] ([StudentCode], [Name], [InstructorCode], [Notes], [OrganizationID]) VALUES (N'1111', N'Lebron James', N'efgh', N'Athletic', 1)
GO
INSERT [dbo].[Student] ([StudentCode], [Name], [InstructorCode], [Notes], [OrganizationID]) VALUES (N'1010', N'Carol Danvers', N'5678', N'Super', 2)
GO
SET IDENTITY_INSERT [dbo].[ContactRequest] ON 
GO
INSERT [dbo].[ContactRequest] ([RequestID], [ContactName], [Phone], [Email], [OrganizationName], [OrganizationType], [DateRequest], [EventNameRequest]) VALUES (1, N'Charles Darwin', 5554444, N'darwin@me.org', N'Clean Middle School', N'School', CAST(N'2020-10-30' AS Date), N'Clean Cyber Day')
GO
INSERT [dbo].[ContactRequest] ([RequestID], [ContactName], [Phone], [Email], [OrganizationName], [OrganizationType], [DateRequest], [EventNameRequest]) VALUES (2, N'Jimmy Hendrix', 7776666, N'hendrix@me.org', N'Simple School', N'School', CAST(N'2020-11-12' AS Date), N'Simple CyberDay')
GO
SET IDENTITY_INSERT [dbo].[ContactRequest] OFF
GOtCode], [Name], [InstructorCode], [Notes], [OrganizationID]) VALUES (N'1010', N'Carol Danvers', N'5678', N'Super', 2)
GO
SET IDENTITY_INSERT [dbo].[ContactRequest] ON 
GO
INSERT [dbo].[ContactRequest] ([RequestID], [ContactName], [Phone], [Email], [OrganizationName], [OrganizationType], [DateRequest], [EventNameRequest]) VALUES (1, N'Bruce Wayne', 5555555, N'wayne@me.org', N'Johnson Middle School', N'School', CAST(N'2020-10-29' AS Date), N'Johnson School Cyber Day')
GO
INSERT [dbo].[ContactRequest] ([RequestID], [ContactName], [Phone], [Email], [OrganizationName], [OrganizationType], [DateRequest], [EventNameRequest]) VALUES (2, N'Clark Kent', 5555588, N'kent@me.org', N'Collegiate School', N'School', CAST(N'2020-11-10' AS Date), N'Collegiate CyberDay')
GO
SET IDENTITY_INSERT [dbo].[ContactRequest] OFF
GO
