IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
CREATE TABLE [AdminUsers] (
    [Id] int NOT NULL IDENTITY,
    [Username] nvarchar(max) NOT NULL,
    [Password] nvarchar(max) NOT NULL,
    [FullName] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_AdminUsers] PRIMARY KEY ([Id])
);

CREATE TABLE [CalendarEvents] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [Start] datetime2 NOT NULL,
    [End] datetime2 NULL,
    [ColorCode] nvarchar(max) NULL,
    CONSTRAINT [PK_CalendarEvents] PRIMARY KEY ([Id])
);

CREATE TABLE [Categories] (
    [Id] int NOT NULL IDENTITY,
    [CategoryName] nvarchar(max) NOT NULL,
    [Description] nvarchar(max) NULL,
    [IconClass] nvarchar(max) NULL,
    [IsDeleted] bit NOT NULL,
    [DeletedAt] datetime2 NULL,
    [DeletedBy] nvarchar(max) NULL,
    CONSTRAINT [PK_Categories] PRIMARY KEY ([Id])
);

CREATE TABLE [Certificates] (
    [Id] int NOT NULL IDENTITY,
    [TcNo] nvarchar(11) NOT NULL,
    [CertificateNo] nvarchar(max) NOT NULL,
    [FullName] nvarchar(max) NOT NULL,
    [CourseName] nvarchar(max) NOT NULL,
    [IssueDate] datetime2 NOT NULL,
    CONSTRAINT [PK_Certificates] PRIMARY KEY ([Id])
);

CREATE TABLE [Complaints] (
    [Id] int NOT NULL IDENTITY,
    [ReporterName] nvarchar(max) NOT NULL,
    [ReporterEmail] nvarchar(max) NOT NULL,
    [Subject] nvarchar(200) NOT NULL,
    [Description] nvarchar(2000) NOT NULL,
    [Category] int NOT NULL,
    [Status] int NOT NULL,
    [AdminNote] nvarchar(max) NULL,
    [CreatedAt] datetime2 NOT NULL,
    [ReviewedAt] datetime2 NULL,
    [ReportedPersonName] nvarchar(max) NULL,
    CONSTRAINT [PK_Complaints] PRIMARY KEY ([Id])
);

CREATE TABLE [EmailLogs] (
    [Id] int NOT NULL IDENTITY,
    [ToEmail] nvarchar(max) NOT NULL,
    [Subject] nvarchar(max) NOT NULL,
    [Body] nvarchar(max) NOT NULL,
    [SentDate] datetime2 NOT NULL,
    [IsSuccess] bit NOT NULL,
    [ErrorMessage] nvarchar(max) NULL,
    CONSTRAINT [PK_EmailLogs] PRIMARY KEY ([Id])
);

CREATE TABLE [LogEntries] (
    [Id] int NOT NULL IDENTITY,
    [UserEmail] nvarchar(max) NULL,
    [Action] nvarchar(max) NULL,
    [Message] nvarchar(max) NULL,
    [Timestamp] datetime2 NOT NULL,
    [IpAddress] nvarchar(max) NULL,
    [ControllerName] nvarchar(max) NULL,
    CONSTRAINT [PK_LogEntries] PRIMARY KEY ([Id])
);

CREATE TABLE [MasterTrainerApplications] (
    [Id] int NOT NULL IDENTITY,
    [FullName] nvarchar(max) NOT NULL,
    [TcNo] nvarchar(11) NOT NULL,
    [BirthYear] int NOT NULL,
    [Phone] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [Address] nvarchar(max) NULL,
    [GraduationStatus] nvarchar(max) NULL,
    [CategoryId] int NOT NULL,
    [CourseId] int NOT NULL,
    [Specialty] nvarchar(max) NULL,
    [CvPath] nvarchar(max) NULL,
    [CriminalRecordPath] nvarchar(max) NULL,
    [DiplomaPath] nvarchar(max) NULL,
    [AvailabilityJson] nvarchar(max) NULL,
    [Status] int NOT NULL,
    [ApplyDate] datetime2 NOT NULL,
    CONSTRAINT [PK_MasterTrainerApplications] PRIMARY KEY ([Id])
);

CREATE TABLE [NewsStories] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [ImageUrl] nvarchar(max) NOT NULL,
    [ActionUrl] nvarchar(max) NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_NewsStories] PRIMARY KEY ([Id])
);

CREATE TABLE [ProfanityBans] (
    [Id] int NOT NULL IDENTITY,
    [UserEmail] nvarchar(max) NOT NULL,
    [UserName] nvarchar(max) NULL,
    [OffenseCount] int NOT NULL,
    [BanUntil] datetime2 NULL,
    [IsPermanent] bit NOT NULL,
    [LastOffenseText] nvarchar(max) NULL,
    [CreatedAt] datetime2 NOT NULL,
    [UpdatedAt] datetime2 NOT NULL,
    [AdminNote] nvarchar(max) NULL,
    CONSTRAINT [PK_ProfanityBans] PRIMARY KEY ([Id])
);

CREATE TABLE [Students] (
    [Id] int NOT NULL IDENTITY,
    [FirstName] nvarchar(max) NULL,
    [LastName] nvarchar(max) NULL,
    [Email] nvarchar(max) NULL,
    [Password] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NULL,
    [TcNo] nvarchar(450) NULL,
    [BirthDate] datetime2 NULL,
    [BirthPlace] nvarchar(max) NULL,
    [Summary] nvarchar(max) NULL,
    [Skills] nvarchar(max) NULL,
    [ProfilePicture] nvarchar(max) NULL,
    [IsDeleted] bit NOT NULL,
    [IsEmployed] bit NOT NULL,
    [StartedBusiness] bit NOT NULL,
    [WelcomeEmailSent] bit NOT NULL,
    CONSTRAINT [PK_Students] PRIMARY KEY ([Id])
);

CREATE TABLE [TemporaryLinks] (
    [Id] int NOT NULL IDENTITY,
    [CertificateCode] nvarchar(max) NOT NULL,
    [Token] nvarchar(max) NOT NULL,
    [ExpiryDate] datetime2 NOT NULL,
    [IsUsed] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_TemporaryLinks] PRIMARY KEY ([Id])
);

CREATE TABLE [Courses] (
    [Id] int NOT NULL IDENTITY,
    [CourseName] nvarchar(max) NOT NULL,
    [Description] nvarchar(max) NULL,
    [ImageUrl] nvarchar(max) NULL,
    [Quota] int NOT NULL,
    [StartDate] datetime2 NOT NULL,
    [EndDate] datetime2 NOT NULL,
    [StartTime] time NOT NULL,
    [EndTime] time NOT NULL,
    [IsActive] bit NOT NULL,
    [DurationHours] int NOT NULL,
    [MaxAbsenceLimit] int NOT NULL,
    [Price] decimal(18,2) NOT NULL,
    [LearningOutcomes] nvarchar(max) NULL,
    [Curriculum] nvarchar(max) NULL,
    [Requirements] nvarchar(max) NULL,
    [WhoIsItFor] nvarchar(max) NULL,
    [ExamDate] datetime2 NULL,
    [CategoryId] int NOT NULL,
    [IsDeleted] bit NOT NULL,
    [DeletedAt] datetime2 NULL,
    [DeletedBy] nvarchar(max) NULL,
    CONSTRAINT [PK_Courses] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Courses_Categories_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Categories] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [Applications] (
    [Id] int NOT NULL IDENTITY,
    [FirstName] nvarchar(max) NOT NULL,
    [LastName] nvarchar(max) NOT NULL,
    [TcNo] nvarchar(max) NULL,
    [PhoneNumber] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NULL,
    [CourseId] int NOT NULL,
    [ApplyDate] datetime2 NOT NULL,
    [DateOfBirth] datetime2 NOT NULL,
    [EducationLevel] nvarchar(max) NOT NULL,
    [Status] int NOT NULL,
    [BirthPlace] nvarchar(max) NULL,
    [AdminNote] nvarchar(max) NULL,
    [CertificateCode] nvarchar(max) NULL,
    [IsCompleted] bit NOT NULL,
    [ExamGrade] int NULL,
    [IsPaid] bit NOT NULL,
    [PaymentMethod] nvarchar(max) NULL,
    [TransactionId] nvarchar(max) NULL,
    [StudentId] int NULL,
    [IsDeleted] bit NOT NULL,
    [DeletedAt] datetime2 NULL,
    [DeletedBy] nvarchar(max) NULL,
    CONSTRAINT [PK_Applications] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Applications_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Applications_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id])
);

CREATE TABLE [Comments] (
    [Id] int NOT NULL IDENTITY,
    [UserEmail] nvarchar(max) NOT NULL,
    [Content] nvarchar(max) NOT NULL,
    [Rating] int NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [CourseId] int NOT NULL,
    CONSTRAINT [PK_Comments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Comments_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [CourseChatMessages] (
    [Id] int NOT NULL IDENTITY,
    [CourseId] int NOT NULL,
    [SenderName] nvarchar(max) NOT NULL,
    [SenderRole] nvarchar(max) NOT NULL,
    [Message] nvarchar(max) NOT NULL,
    [OriginalMessage] nvarchar(max) NULL,
    [IsCensored] bit NOT NULL,
    [SentAt] datetime2 NOT NULL,
    [SenderEmail] nvarchar(max) NULL,
    [InstructorId] int NULL,
    CONSTRAINT [PK_CourseChatMessages] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CourseChatMessages_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [CourseResources] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [FilePath] nvarchar(max) NULL,
    [FileType] nvarchar(max) NULL,
    [UploadDate] datetime2 NOT NULL,
    [CourseId] int NOT NULL,
    CONSTRAINT [PK_CourseResources] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CourseResources_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [CourseReviews] (
    [Id] int NOT NULL IDENTITY,
    [StudentId] int NOT NULL,
    [CourseId] int NOT NULL,
    [Rating] int NOT NULL,
    [Comment] nvarchar(500) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [IsApproved] bit NOT NULL,
    CONSTRAINT [PK_CourseReviews] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_CourseReviews_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_CourseReviews_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [ExhibitionItems] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [ImageUrl] nvarchar(max) NULL,
    [ModelUrl] nvarchar(max) NULL,
    [VideoUrl] nvarchar(max) NULL,
    [Type] int NOT NULL,
    [ArtistName] nvarchar(max) NOT NULL,
    [CourseId] int NULL,
    [CreatedAt] datetime2 NOT NULL,
    [PositionX] real NOT NULL,
    [PositionY] real NOT NULL,
    [PositionZ] real NOT NULL,
    [RotationY] real NOT NULL,
    [TechDetails] nvarchar(max) NULL,
    [ExternalLink] nvarchar(max) NULL,
    CONSTRAINT [PK_ExhibitionItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_ExhibitionItems_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id])
);

CREATE TABLE [GalleryItems] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [Description] nvarchar(max) NULL,
    [ImageUrl] nvarchar(max) NULL,
    [CourseId] int NULL,
    [ViewCount] int NOT NULL,
    [ExifInfo] nvarchar(max) NULL,
    [Tags] nvarchar(max) NULL,
    [CreatedAt] datetime2 NOT NULL,
    [IsDeleted] bit NOT NULL,
    [DeletedAt] datetime2 NULL,
    [DeletedBy] nvarchar(max) NULL,
    CONSTRAINT [PK_GalleryItems] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_GalleryItems_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id])
);

CREATE TABLE [Instructors] (
    [Id] int NOT NULL IDENTITY,
    [FullName] nvarchar(max) NULL,
    [Title] nvarchar(max) NULL,
    [ImageUrl] nvarchar(max) NULL,
    [Username] nvarchar(max) NULL,
    [Password] nvarchar(max) NULL,
    [CourseId] int NULL,
    [CvFilePath] nvarchar(max) NULL,
    [IsDeleted] bit NOT NULL,
    [DeletedAt] datetime2 NULL,
    [DeletedBy] nvarchar(max) NULL,
    CONSTRAINT [PK_Instructors] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Instructors_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id])
);

CREATE TABLE [News] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NULL,
    [Content] nvarchar(max) NULL,
    [Date] datetime2 NOT NULL,
    [PublishDate] datetime2 NOT NULL,
    [PosterUrl] nvarchar(max) NULL,
    [ImageUrl] nvarchar(max) NULL,
    [CourseId] int NULL,
    [IsDeleted] bit NOT NULL,
    [DeletedAt] datetime2 NULL,
    [DeletedBy] nvarchar(max) NULL,
    CONSTRAINT [PK_News] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_News_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id])
);

CREATE TABLE [SuccessStories] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [Summary] nvarchar(max) NOT NULL,
    [Content] nvarchar(max) NOT NULL,
    [CoverImage] nvarchar(max) NULL,
    [BeforeImage] nvarchar(max) NULL,
    [AfterImage] nvarchar(max) NULL,
    [VideoUrl] nvarchar(max) NULL,
    [CourseId] int NULL,
    [StudentId] int NULL,
    [CreatedAt] datetime2 NOT NULL,
    [IsActive] bit NOT NULL,
    CONSTRAINT [PK_SuccessStories] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_SuccessStories_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]),
    CONSTRAINT [FK_SuccessStories_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id])
);

CREATE TABLE [Attendances] (
    [Id] int NOT NULL IDENTITY,
    [ApplicationId] int NOT NULL,
    [CourseId] int NOT NULL,
    [Date] datetime2 NOT NULL,
    [IsPresent] bit NOT NULL,
    [Note] nvarchar(max) NULL,
    CONSTRAINT [PK_Attendances] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Attendances_Applications_ApplicationId] FOREIGN KEY ([ApplicationId]) REFERENCES [Applications] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_Attendances_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE NO ACTION
);

CREATE TABLE [GalleryComments] (
    [Id] int NOT NULL IDENTITY,
    [Content] nvarchar(max) NOT NULL,
    [UserEmail] nvarchar(max) NULL,
    [X] decimal(18,2) NULL,
    [Y] decimal(18,2) NULL,
    [IsInstructorResponse] bit NOT NULL,
    [IsApproved] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [GalleryItemId] int NOT NULL,
    CONSTRAINT [PK_GalleryComments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_GalleryComments_GalleryItems_GalleryItemId] FOREIGN KEY ([GalleryItemId]) REFERENCES [GalleryItems] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [GalleryLikes] (
    [Id] int NOT NULL IDENTITY,
    [UserEmail] nvarchar(max) NULL,
    [GalleryItemId] int NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_GalleryLikes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_GalleryLikes_GalleryItems_GalleryItemId] FOREIGN KEY ([GalleryItemId]) REFERENCES [GalleryItems] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [InstructorSchedules] (
    [Id] int NOT NULL IDENTITY,
    [InstructorId] int NOT NULL,
    [Day] nvarchar(max) NOT NULL,
    [StartTime] time NOT NULL,
    [EndTime] time NOT NULL,
    [Note] nvarchar(max) NULL,
    CONSTRAINT [PK_InstructorSchedules] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_InstructorSchedules_Instructors_InstructorId] FOREIGN KEY ([InstructorId]) REFERENCES [Instructors] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [Messages] (
    [Id] int NOT NULL IDENTITY,
    [SenderUsername] nvarchar(max) NOT NULL,
    [ReceiverInstructorId] int NOT NULL,
    [Subject] nvarchar(max) NOT NULL,
    [Content] nvarchar(max) NOT NULL,
    [Date] datetime2 NOT NULL,
    [IsRead] bit NOT NULL,
    [ReceiverUsername] nvarchar(max) NULL,
    [IsFromInstructor] bit NOT NULL,
    CONSTRAINT [PK_Messages] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_Messages_Instructors_ReceiverInstructorId] FOREIGN KEY ([ReceiverInstructorId]) REFERENCES [Instructors] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [TeacherChatMessages] (
    [Id] int NOT NULL IDENTITY,
    [InstructorId] int NOT NULL,
    [SenderName] nvarchar(max) NOT NULL,
    [Message] nvarchar(max) NOT NULL,
    [OriginalMessage] nvarchar(max) NULL,
    [IsCensored] bit NOT NULL,
    [SentAt] datetime2 NOT NULL,
    CONSTRAINT [PK_TeacherChatMessages] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_TeacherChatMessages_Instructors_InstructorId] FOREIGN KEY ([InstructorId]) REFERENCES [Instructors] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [NewsComments] (
    [Id] int NOT NULL IDENTITY,
    [NewsId] int NOT NULL,
    [Content] nvarchar(max) NOT NULL,
    [UserEmail] nvarchar(max) NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [IsApproved] bit NOT NULL,
    CONSTRAINT [PK_NewsComments] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NewsComments_News_NewsId] FOREIGN KEY ([NewsId]) REFERENCES [News] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [NewsLikes] (
    [Id] int NOT NULL IDENTITY,
    [NewsId] int NOT NULL,
    [UserEmail] nvarchar(max) NULL,
    CONSTRAINT [PK_NewsLikes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_NewsLikes_News_NewsId] FOREIGN KEY ([NewsId]) REFERENCES [News] ([Id]) ON DELETE CASCADE
);

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FullName', N'Password', N'Username') AND [object_id] = OBJECT_ID(N'[AdminUsers]'))
    SET IDENTITY_INSERT [AdminUsers] ON;
INSERT INTO [AdminUsers] ([Id], [FullName], [Password], [Username])
VALUES (1, N'Betül Gökden', N'0808', N'Betül');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'FullName', N'Password', N'Username') AND [object_id] = OBJECT_ID(N'[AdminUsers]'))
    SET IDENTITY_INSERT [AdminUsers] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ColorCode', N'End', N'Start', N'Title') AND [object_id] = OBJECT_ID(N'[CalendarEvents]'))
    SET IDENTITY_INSERT [CalendarEvents] ON;
INSERT INTO [CalendarEvents] ([Id], [ColorCode], [End], [Start], [Title])
VALUES (1, N'#C5A059', '2026-05-01T17:00:00.0000000', '2026-05-01T09:00:00.0000000', N'Yaz Dönemi Kayıt Başlangıcı'),
(2, N'#10b981', '2026-05-15T16:00:00.0000000', '2026-05-15T14:00:00.0000000', N'Sertifika Töreni');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ColorCode', N'End', N'Start', N'Title') AND [object_id] = OBJECT_ID(N'[CalendarEvents]'))
    SET IDENTITY_INSERT [CalendarEvents] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CategoryName', N'DeletedAt', N'DeletedBy', N'Description', N'IconClass', N'IsDeleted') AND [object_id] = OBJECT_ID(N'[Categories]'))
    SET IDENTITY_INSERT [Categories] ON;
INSERT INTO [Categories] ([Id], [CategoryName], [DeletedAt], [DeletedBy], [Description], [IconClass], [IsDeleted])
VALUES (1, N'Bilişim Teknolojileri', NULL, NULL, N'Yazılım, donanım ve dijital beceriler', N'bi-laptop', CAST(0 AS bit)),
(2, N'Yabancı Diller', NULL, NULL, N'İngilizce, Almanca, Arapça dil kursları', N'bi-translate', CAST(0 AS bit)),
(3, N'El Sanatları', NULL, NULL, N'Ahşap boyama, nakış, seramik atölyeleri', N'bi-palette', CAST(0 AS bit)),
(4, N'Müzik', NULL, NULL, N'Enstrüman ve ses eğitimi programları', N'bi-music-note-beamed', CAST(0 AS bit)),
(5, N'Spor ve Sağlık', NULL, NULL, N'Fitness, yoga, yüzme kursları', N'bi-heart-pulse', CAST(0 AS bit)),
(6, N'Aşçılık ve Pastacılık', NULL, NULL, N'Mutfak sanatları ve gastronomi', N'bi-cup-hot', CAST(0 AS bit)),
(7, N'Güzellik ve Bakım', NULL, NULL, N'Kuaförlük, cilt bakımı, makyaj', N'bi-scissors', CAST(0 AS bit)),
(8, N'Mesleki Eğitim', NULL, NULL, N'Sertifikalı mesleki gelişim programları', N'bi-briefcase', CAST(0 AS bit));
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CategoryName', N'DeletedAt', N'DeletedBy', N'Description', N'IconClass', N'IsDeleted') AND [object_id] = OBJECT_ID(N'[Categories]'))
    SET IDENTITY_INSERT [Categories] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CertificateNo', N'CourseName', N'FullName', N'IssueDate', N'TcNo') AND [object_id] = OBJECT_ID(N'[Certificates]'))
    SET IDENTITY_INSERT [Certificates] ON;
INSERT INTO [Certificates] ([Id], [CertificateNo], [CourseName], [FullName], [IssueDate], [TcNo])
VALUES (1, N'HE-2026-0001', N'Yapay Zeka Destekli Python Programlama', N'Ali Koç', '2026-04-15T00:00:00.0000000', N'12345678901'),
(2, N'HE-2026-0002', N'Akademik ve Günlük İngilizce (A1-A2)', N'Ayşe Demir', '2026-04-20T00:00:00.0000000', N'23456789012');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CertificateNo', N'CourseName', N'FullName', N'IssueDate', N'TcNo') AND [object_id] = OBJECT_ID(N'[Certificates]'))
    SET IDENTITY_INSERT [Certificates] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CourseId', N'CreatedAt', N'DeletedAt', N'DeletedBy', N'Description', N'ExifInfo', N'ImageUrl', N'IsDeleted', N'Tags', N'Title', N'ViewCount') AND [object_id] = OBJECT_ID(N'[GalleryItems]'))
    SET IDENTITY_INSERT [GalleryItems] ON;
INSERT INTO [GalleryItems] ([Id], [CourseId], [CreatedAt], [DeletedAt], [DeletedBy], [Description], [ExifInfo], [ImageUrl], [IsDeleted], [Tags], [Title], [ViewCount])
VALUES (1, NULL, '2026-05-02T18:23:13.6637782+03:00', NULL, NULL, N'Temel bilişim eğitimlerimizden kareler.', NULL, N'https://images.unsplash.com/photo-1427504494785-3a9ca7044f45?w=800', CAST(0 AS bit), NULL, N'Bilgisayar Okuryazarlığı', 0),
(2, NULL, '2026-05-02T18:23:13.6639309+03:00', NULL, NULL, N'Grup çalışmaları ile sosyalleşme.', NULL, N'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800', CAST(0 AS bit), NULL, N'Etkili İletişim', 0),
(3, NULL, '2026-05-02T18:23:13.6639314+03:00', NULL, NULL, N'İleri seviye kodlama atölyelerimiz.', NULL, N'https://images.unsplash.com/photo-1542831371-29b0f74f9713?w=800', CAST(0 AS bit), NULL, N'Yazılım Geliştirme', 0),
(4, NULL, '2026-05-02T18:23:13.6639318+03:00', NULL, NULL, N'Sanat atölyelerinde yaratıcılık.', NULL, N'https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=800', CAST(0 AS bit), NULL, N'Resim ve Sanat', 0),
(5, NULL, '2026-05-02T18:23:13.6639320+03:00', NULL, NULL, N'Gurme lezzetlerin hazırlandığı mutfaklarımız.', NULL, N'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=800', CAST(0 AS bit), NULL, N'Aşçılık ve Mutfak', 0),
(6, NULL, '2026-05-02T18:23:13.6639323+03:00', NULL, NULL, N'Topluluk önünde konuşma etkinliği.', NULL, N'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=800', CAST(0 AS bit), NULL, N'Sunum Eğitimi', 0),
(7, NULL, '2026-05-02T18:23:13.6639325+03:00', NULL, NULL, N'Müziğin ritmini yakalayan öğrencilerimiz.', NULL, N'https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=800', CAST(0 AS bit), NULL, N'Gitar Eğitimleri', 0),
(8, NULL, '2026-05-02T18:23:13.6639327+03:00', NULL, NULL, N'Klasik müzik yeteneklerini geliştirirken.', NULL, N'https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=800', CAST(0 AS bit), NULL, N'Keman Sınıfı', 0),
(9, NULL, '2026-05-02T18:23:13.6639330+03:00', NULL, NULL, N'Zihin ve beden bütünlüğü için aktiviteler.', NULL, N'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=800', CAST(0 AS bit), NULL, N'Spor ve Yoga', 0),
(10, NULL, '2026-05-02T18:23:13.6639332+03:00', NULL, NULL, N'Proje fikirlerinin tartışıldığı toplantılar.', NULL, N'https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=800', CAST(0 AS bit), NULL, N'Girişimcilik', 0),
(11, NULL, '2026-05-02T18:23:13.6639334+03:00', NULL, NULL, N'Yeni nesil mucitler iş başında.', NULL, N'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=800', CAST(0 AS bit), NULL, N'Robotik Kodlama', 0),
(12, NULL, '2026-05-02T18:23:13.6639336+03:00', NULL, NULL, N'Dünya mutfaklarından harika tarifler.', NULL, N'https://images.unsplash.com/photo-1606787619248-f301830a5a57?w=800', CAST(0 AS bit), NULL, N'Gastronomi Uzmanlığı', 0);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CourseId', N'CreatedAt', N'DeletedAt', N'DeletedBy', N'Description', N'ExifInfo', N'ImageUrl', N'IsDeleted', N'Tags', N'Title', N'ViewCount') AND [object_id] = OBJECT_ID(N'[GalleryItems]'))
    SET IDENTITY_INSERT [GalleryItems] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CourseId', N'Date', N'DeletedAt', N'DeletedBy', N'ImageUrl', N'IsDeleted', N'PosterUrl', N'PublishDate', N'Title') AND [object_id] = OBJECT_ID(N'[News]'))
    SET IDENTITY_INSERT [News] ON;
INSERT INTO [News] ([Id], [Content], [CourseId], [Date], [DeletedAt], [DeletedBy], [ImageUrl], [IsDeleted], [PosterUrl], [PublishDate], [Title])
VALUES (1, N'Halk Eğitim Merkezimizin 2026 yaz dönemi kurs kayıtları başlamıştır. 15 farklı branşta ücretsiz eğitim fırsatı! Kontenjanlar sınırlıdır, acele edin.', NULL, '2026-04-01T00:00:00.0000000', NULL, NULL, N'/images/news/summer_registrations.png', CAST(0 AS bit), NULL, '2026-04-01T00:00:00.0000000', N'2026 Yaz Dönemi Kayıtları Başladı!'),
(2, N'Bilişim teknolojileri kategorisinde yeni Python Programlama kursu açılmıştır. Yapay zeka ve veri bilimi alanına adım atmak isteyenler için harika bir fırsat.', NULL, '2026-04-05T00:00:00.0000000', NULL, NULL, N'/images/news/python_course.png', CAST(0 AS bit), NULL, '2026-04-05T00:00:00.0000000', N'Python Programlama Kursu Açıldı'),
(3, N'2025-2026 eğitim dönemini başarıyla tamamlayan 450 kursiyerimize sertifikaları düzenlenen törenle verildi. Tüm mezunlarımızı tebrik ederiz.', NULL, '2026-03-20T00:00:00.0000000', NULL, NULL, N'/images/news/certificate_ceremony.png', CAST(0 AS bit), NULL, '2026-03-20T00:00:00.0000000', N'Sertifika Töreni Gerçekleştirildi'),
(4, N'KOSGEB işbirliğiyle düzenlenen ücretsiz girişimcilik semineri 15 Haziran''da merkezimizde gerçekleştirilecektir. Tüm vatandaşlarımız davetlidir.', NULL, '2026-04-08T00:00:00.0000000', NULL, NULL, N'/images/news/entrepreneurship.png', CAST(0 AS bit), NULL, '2026-04-08T00:00:00.0000000', N'Ücretsiz Girişimcilik Semineri'),
(5, N'Merkezimiz bünyesinde düzenlenecek olan ''Genç Mucitler'' robotik kodlama yarışması için başvurular başladı. Kendi robotunu tasarla, ödülü kazan!', NULL, '2026-05-01T00:00:00.0000000', NULL, NULL, N'/images/news/robotics.png', CAST(0 AS bit), NULL, '2026-05-01T00:00:00.0000000', N'Robotik Kodlama Yarışması'),
(6, N'El sanatları kursiyerlerimizin yıl boyunca hazırladığı nadide eserler, 20 Mayıs''ta kapılarını ziyaretçilere açacak olan büyük sergimizde listelenecek.', NULL, '2026-05-02T00:00:00.0000000', NULL, NULL, N'/images/news/exhibition.png', CAST(0 AS bit), NULL, '2026-05-02T00:00:00.0000000', N'Geleneksel El Sanatları Sergisi'),
(7, N'Her hafta Cumartesi günleri gerçekleştirilecek olan ''English Speaking Club'' ile dil becerilerinizi eğlenceli bir ortamda geliştirin. Katılım ücretsizdir.', NULL, '2026-05-03T00:00:00.0000000', NULL, NULL, N'/images/news/speaking_club.png', CAST(0 AS bit), NULL, '2026-05-03T00:00:00.0000000', N'İngilizce Konuşma Kulübü'),
(8, N'Dünya mutfağının seçkin lezzetlerini profesyonel şeflerden öğrenmek ister misiniz? Modern Gastronomi atölyelerimiz için yeni dönem kayıtları devam ediyor.', NULL, '2026-05-04T00:00:00.0000000', NULL, NULL, N'/images/news/gastronomy.png', CAST(0 AS bit), NULL, '2026-05-04T00:00:00.0000000', N'Modern Gastronomi Atölyesi');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CourseId', N'Date', N'DeletedAt', N'DeletedBy', N'ImageUrl', N'IsDeleted', N'PosterUrl', N'PublishDate', N'Title') AND [object_id] = OBJECT_ID(N'[News]'))
    SET IDENTITY_INSERT [News] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'BirthDate', N'BirthPlace', N'Email', N'FirstName', N'IsDeleted', N'IsEmployed', N'LastName', N'Password', N'PhoneNumber', N'ProfilePicture', N'Skills', N'StartedBusiness', N'Summary', N'TcNo', N'WelcomeEmailSent') AND [object_id] = OBJECT_ID(N'[Students]'))
    SET IDENTITY_INSERT [Students] ON;
INSERT INTO [Students] ([Id], [BirthDate], [BirthPlace], [Email], [FirstName], [IsDeleted], [IsEmployed], [LastName], [Password], [PhoneNumber], [ProfilePicture], [Skills], [StartedBusiness], [Summary], [TcNo], [WelcomeEmailSent])
VALUES (99, '2000-01-01T00:00:00.0000000', N'Ankara', N'betulgokden8@gmail.com', N'Betül', CAST(0 AS bit), CAST(0 AS bit), N'Gökden', N'cinar08', NULL, NULL, NULL, CAST(0 AS bit), NULL, N'12345678901', CAST(0 AS bit));
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'BirthDate', N'BirthPlace', N'Email', N'FirstName', N'IsDeleted', N'IsEmployed', N'LastName', N'Password', N'PhoneNumber', N'ProfilePicture', N'Skills', N'StartedBusiness', N'Summary', N'TcNo', N'WelcomeEmailSent') AND [object_id] = OBJECT_ID(N'[Students]'))
    SET IDENTITY_INSERT [Students] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CategoryId', N'CourseName', N'Curriculum', N'DeletedAt', N'DeletedBy', N'Description', N'DurationHours', N'EndDate', N'EndTime', N'ExamDate', N'ImageUrl', N'IsActive', N'IsDeleted', N'LearningOutcomes', N'MaxAbsenceLimit', N'Price', N'Quota', N'Requirements', N'StartDate', N'StartTime', N'WhoIsItFor') AND [object_id] = OBJECT_ID(N'[Courses]'))
    SET IDENTITY_INSERT [Courses] ON;
INSERT INTO [Courses] ([Id], [CategoryId], [CourseName], [Curriculum], [DeletedAt], [DeletedBy], [Description], [DurationHours], [EndDate], [EndTime], [ExamDate], [ImageUrl], [IsActive], [IsDeleted], [LearningOutcomes], [MaxAbsenceLimit], [Price], [Quota], [Requirements], [StartDate], [StartTime], [WhoIsItFor])
VALUES (1, 1, N'Yapay Zeka Destekli Python Programlama', CONCAT(CAST(N'Hafta 1: Python''a Giriş ve Değişkenler' AS nvarchar(max)), nchar(10), N'Hafta 2: Kontrol Yapıları ve Döngüler', nchar(10), N'Hafta 3: Fonksiyonlar ve Modüler Programlama', nchar(10), N'Hafta 4: Nesne Yönelimli Programlama (OOP)', nchar(10), N'Hafta 5: Dosya İşlemleri ve Veri Tabanı', nchar(10), N'Hafta 6: Veri Analizi Temelleri (Pandas & Numpy)', nchar(10), N'Hafta 7: Yapay Zeka ve ML Giriş (Scikit-Learn)', nchar(10), N'Hafta 8: Bitirme Projesi ve Sertifika Töreni'), NULL, NULL, N'Geleceğin dünyasını kodlamaya hazır mısınız? Bu kurs, Python''un gücünü Yapay Zeka (AI) ile birleştirerek size eşsiz bir kariyer kapısı açıyor. Veri biliminden otomasyona kadar modern teknolojinin kalbinde yer alacaksınız. Sadece öğrenmekle kalmayacak, üreteceksiniz!', 80, '2026-07-31T00:00:00.0000000', '12:00:00', '2026-07-25T00:00:00.0000000', N'https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Sıfırdan İleri Seviye Python Geliştirme' AS nvarchar(max)), nchar(10), N'Yapay Zeka ve Makine Öğrenmesi Modelleri', nchar(10), N'Büyük Veri Analizi ve Görselleştirme', nchar(10), N'Akıllı Sohbet Botları (Chatbot) Tasarımı', nchar(10), N'Otomatik Veri Madenciliği ve Raporlama'), 4, 500.0, 25, N'Temel bilgisayar kullanımı.', '2026-05-01T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(2, 1, N'Modern Web Tasarım ve Full-Stack Giriş', CONCAT(CAST(N'Hafta 1: Web Temelleri ve HTML5 Semantik Yapı' AS nvarchar(max)), nchar(10), N'Hafta 2: CSS3 Tasarım, Renk Teorisi ve Tipografi', nchar(10), N'Hafta 3: Layout Sistemleri (Flexbox & CSS Grid)', nchar(10), N'Hafta 4: JavaScript Temelleri ve Algoritma Mantığı', nchar(10), N'Hafta 5: DOM Manipülasyonu ve Dinamik Formlar', nchar(10), N'Hafta 6: Modern Framework''lere Bakış (React/Vue)', nchar(10), N'Hafta 7: Web Erişilebilirliği ve Arama Motoru Uyumu', nchar(10), N'Hafta 8: Full-Stack Proje Sunumu ve Değerlendirme'), NULL, NULL, N'İnternetin görünen yüzünü ve arkasındaki teknolojiyi siz inşa edin. Modern web standartlarını (HTML5, CSS3, JS) öğrenerek dünyaca ünlü siteler gibi projeler geliştireceksiniz. Kendi dijital markanızı yaratma fırsatını yakalayın!', 60, '2026-07-15T00:00:00.0000000', '12:00:00', '2026-07-10T00:00:00.0000000', N'https://images.unsplash.com/photo-1547658719-da2b51169166?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Profesyonel UI/UX Tasarım Prensipleri' AS nvarchar(max)), nchar(10), N'Responsive (Mobil Uyumlu) Modern Layoutlar', nchar(10), N'JavaScript ile İnteraktif Web Uygulamaları', nchar(10), N'Bootstrap ve Tailwind ile Hızlı Prototipleme', nchar(10), N'SEO ve Web Performans Optimizasyonu'), 4, 500.0, 30, N'Temel bilgisayar kullanımı.', '2026-05-15T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(3, 1, N'Bilgisayar İşletmenliği (Operatörlük)', CONCAT(CAST(N'Hafta 1: Temel Bilgisayar ve Windows Kullanımı' AS nvarchar(max)), nchar(10), N'Hafta 2: Word ile Profesyonel Dökümantasyon', nchar(10), N'Hafta 3: Excel: Temel Fonksiyonlar ve Tablolar', nchar(10), N'Hafta 4: Excel: Veri Analizi ve Grafik Oluşturma', nchar(10), N'Hafta 5: PowerPoint ile Sunum Sanatı', nchar(10), N'Hafta 6: Outlook ve Kurumsal E-Posta Yönetimi', nchar(10), N'Hafta 7: Bulut Depolama ve Ortak Çalışma Araçları', nchar(10), N'Hafta 8: Klavye Teknikleri ve Final Sınavı'), NULL, NULL, N'İş hayatının vazgeçilmez becerilerini kazanın. MS Office programlarını (Excel, Word, PowerPoint) uzman seviyesinde kullanarak iş verimliliğinizi 10 katına çıkarın. Resmi onaylı sertifikanızla CV''nizi parlatın.', 120, '2026-08-15T00:00:00.0000000', '12:00:00', '2026-08-10T00:00:00.0000000', N'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'İleri Seviye Excel Formülleri ve Raporlama' AS nvarchar(max)), nchar(10), N'Profesyonel Yazışma ve Rapor Tasarımı (Word)', nchar(10), N'Etkileyici Sunum Teknikleri (PowerPoint)', nchar(10), N'Windows ve Dosya Yönetimi Uzmanlığı', nchar(10), N'İnternet Güvenliği ve Bulut Teknolojileri'), 4, 500.0, 35, N'Temel bilgisayar kullanımı.', '2026-04-15T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(4, 2, N'Akademik ve Günlük İngilizce (A1-A2)', CONCAT(CAST(N'Hafta 1: Kendini Tanıtma ve Temel Selamlaşma' AS nvarchar(max)), nchar(10), N'Hafta 2: Şimdiki Zaman ve Günlük Rutinler', nchar(10), N'Hafta 3: Nesneler, Yerler ve Edatlar', nchar(10), N'Hafta 4: Geçmiş Zaman ve Anı Anlatma', nchar(10), N'Hafta 5: Gelecek Planları ve Hayaller', nchar(10), N'Hafta 6: Restoran, Alışveriş ve Hastane Diyalogları', nchar(10), N'Hafta 7: Seyahat, Havaalanı ve Otel İşlemleri', nchar(10), N'Hafta 8: Serbest Konuşma Pratiği ve Mezuniyet'), NULL, NULL, N'İngilizce öğrenmek artık bir lüks değil, bir zorunluluk. Korkularınızı geride bırakın! Konuşma odaklı eğitimimizle dünyanın neresinde olursanız olun kendinizi ifade edebileceksiniz. Yeni insanlar, yeni kültürler sizi bekliyor.', 90, '2026-08-01T00:00:00.0000000', '12:00:00', '2026-07-28T00:00:00.0000000', N'https://images.unsplash.com/photo-1543109740-4bdb38fda756?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Özgüvenli Günlük Konuşma Becerisi' AS nvarchar(max)), nchar(10), N'Temel Gramer ve Zamanların Doğru Kullanımı', nchar(10), N'2000+ Kelimelik Aktif Kelime Dağarcığı', nchar(10), N'Dinlediğini Anlama ve Doğru Telaffuz', nchar(10), N'Yabancı Kaynakları Okuma ve Anlama Kapasitesi'), 4, 500.0, 20, N'Temel bilgisayar kullanımı.', '2026-05-01T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(5, 2, N'Almanca Temel Kurs (A1)', CONCAT(CAST(N'Hafta 1: Alfabe, Sayılar ve Temel Telaffuz' AS nvarchar(max)), nchar(10), N'Hafta 2: Fiil Çekimleri ve Şahıs Zamirleri', nchar(10), N'Hafta 3: Aile, Ev ve Yaşam Alanları', nchar(10), N'Hafta 4: Hobiler ve Boş Zaman Aktiviteleri', nchar(10), N'Hafta 5: Saatler ve Zaman İfadeleri', nchar(10), N'Hafta 6: Okul ve İş Dünyası Terimleri', nchar(10), N'Hafta 7: Sağlık, Yemek ve Kültürel Alışkanlıklar', nchar(10), N'Hafta 8: Rol Yapma (Role Play) ve Final Testi'), NULL, NULL, N'Avrupa''nın kalbine giden yolu açın. Almanca öğrenerek eğitim ve kariyer fırsatlarını yakalayın. Sistematik yaklaşımımızla zor görünen bu dili eğlenerek öğreneceksiniz.', 60, '2026-08-30T00:00:00.0000000', '12:00:00', '2026-08-25T00:00:00.0000000', N'https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Temel Almanca Gramer Yapısı' AS nvarchar(max)), nchar(10), N'Günlük İhtiyaçları Karşılayacak Konuşma', nchar(10), N'Alman Kültürü ve Yaşam Tarzı Bilgisi', nchar(10), N'Basit Metinleri Okuma ve Yazma', nchar(10), N'Doğru Fonetik ve Telaffuz Teknikleri'), 4, 1000.0, 15, N'Temel bilgisayar kullanımı.', '2026-06-01T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(6, 3, N'Ahşap Boyama ve Dekorasyon Sanatı', CONCAT(CAST(N'Hafta 1: Malzeme Bilgisi ve Yüzey Hazırlığı' AS nvarchar(max)), nchar(10), N'Hafta 2: Temel Boyama ve Fırça Teknikleri', nchar(10), N'Hafta 3: Çatlatma ve Eskitme Yöntemleri', nchar(10), N'Hafta 4: Stencil (Şablon) ile Desen Oluşturma', nchar(10), N'Hafta 5: Dekupaj ve Kolaj Uygulamaları', nchar(10), N'Hafta 6: Rölyef Pasta ve Kabartma Teknikleri', nchar(10), N'Hafta 7: Takı Kutusu ve Obje Tasarımı', nchar(10), N'Hafta 8: Sergi Hazırlığı ve Final Ürünü'), NULL, NULL, N'Evinizdeki eski eşyaları birer sanat eserine dönüştürün! Ahşabın sıcaklığını renklerle birleştirerek yaratıcılığınızı konuşturun. Hem dinlendirici bir hobi edinin hem de kendi ürünlerinizi üretin.', 40, '2026-07-10T00:00:00.0000000', '12:00:00', '2026-07-05T00:00:00.0000000', N'https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Ahşap Yüzey Hazırlama ve Zımparalama' AS nvarchar(max)), nchar(10), N'Farklı Boyama ve Eskitme Teknikleri', nchar(10), N'Dekupaj ve Transfer Uygulamaları', nchar(10), N'Vernikleme ve Koruma Yöntemleri', nchar(10), N'Sanatsal Kompozisyon ve Renk Teorisi'), 4, 1000.0, 20, N'Temel bilgisayar kullanımı.', '2026-05-10T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(7, 3, N'Geleneksel Seramik ve Çömlekçilik', CONCAT(CAST(N'Hafta 1: Seramik Çamuru ve Alet Tanıtımı' AS nvarchar(max)), nchar(10), N'Hafta 2: Plaka Yöntemi ile Kutu Yapımı', nchar(10), N'Hafta 3: Fitil (Sucuk) Yöntemi ile Vazo Tasarımı', nchar(10), N'Hafta 4: Çimdikleme Yöntemi ile Kase Yapımı', nchar(10), N'Hafta 5: Kuruma Süreçleri ve Rötuş', nchar(10), N'Hafta 6: Sır Altı Boyama Teknikleri', nchar(10), N'Hafta 7: Sırlama ve Fırın Hazırlığı', nchar(10), N'Hafta 8: Fırın Açılışı ve Ürün Teslimi'), NULL, NULL, N'Toprağın ellerinizde şekil alışına şahit olun. Çamurun terapi etkisinden faydalanırken, kendi mutfağınız için tabaklar, vazolar ve dekoratif objeler üreteceksiniz. Bin yıllık bir geleneği keşfedin.', 50, '2026-08-20T00:00:00.0000000', '12:00:00', '2026-08-15T00:00:00.0000000', N'https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Çamur Hazırlama ve Yoğurma Teknikleri' AS nvarchar(max)), nchar(10), N'Elde Şekillendirme (Fitil, Plaka, Sucuk)', nchar(10), N'Turnet Kullanımı ve Simetri', nchar(10), N'Sırlama ve Boyama Sanatı', nchar(10), N'Pişirme Süreçleri ve Fırın Bilgisi'), 4, 750.0, 15, N'Temel bilgisayar kullanımı.', '2026-05-20T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(8, 4, N'Gitar Eğitimi (Klasik ve Akustik)', CONCAT(CAST(N'Hafta 1: Gitar Tanıtımı ve Boş Tel Egzersizleri' AS nvarchar(max)), nchar(10), N'Hafta 2: Nota Yerleri ve İlk Akorlar', nchar(10), N'Hafta 3: Temel Ritim Kalıpları', nchar(10), N'Hafta 4: Arpej Teknikleri ve Parmak Hızı', nchar(10), N'Hafta 5: Bareli Akorlar ve Geçişler', nchar(10), N'Hafta 6: Şarkı Formları ve Eşlik Etme', nchar(10), N'Hafta 7: Tab Okuma ve Solo Giriş', nchar(10), N'Hafta 8: Konser Hazırlığı ve Performans'), NULL, NULL, N'Müziğin evrensel dilini gitarla keşfedin. Notaların büyülü dünyasına adım atarak sevdiğiniz şarkıları çalmaya başlayın. Parmak egzersizlerinden sahne duruşuna kadar tam kapsamlı bir eğitim.', 45, '2026-07-30T00:00:00.0000000', '12:00:00', '2026-07-25T00:00:00.0000000', N'https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Nota Okuma ve Temel Müzik Teorisi' AS nvarchar(max)), nchar(10), N'Doğru Oturuş ve Tutuş Teknikleri', nchar(10), N'Akustik ve Klasik Akor Bilgisi', nchar(10), N'Ritim ve Arpej Uygulamaları', nchar(10), N'Popüler Parça Analizi ve İcrası'), 4, 750.0, 12, N'Temel bilgisayar kullanımı.', '2026-05-05T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(9, 4, N'Bağlama (Saz) Kursu', CONCAT(CAST(N'Hafta 1: Bağlama Parçaları ve Akort Yapımı' AS nvarchar(max)), nchar(10), N'Hafta 2: Nota Yerleri ve İlk Egzersizler', nchar(10), N'Hafta 3: Basit Türküler ve Tartım Kalıpları', nchar(10), N'Hafta 4: Parmak Çarpma ve Çekme Teknikleri', nchar(10), N'Hafta 5: Orta Seviye Türkü İcrası', nchar(10), N'Hafta 6: Bağlama Düzeni ve Diğer Düzenler', nchar(10), N'Hafta 7: Yöresel Tavır Çalışmaları', nchar(10), N'Hafta 8: Türkü Sunumu ve Sertifika'), NULL, NULL, N'Özümüzden bir sesi, bağlamayı öğrenin. Anadolu''nun bin yıllık ezgilerini tellerle dile getirin. Türkülerimizi doğru teknik ve tavırla icra etmek için profesyonel bir başlangıç yapın.', 50, '2026-08-30T00:00:00.0000000', '12:00:00', '2026-08-20T00:00:00.0000000', N'https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Bağlama Düzeni ve Tezene Teknikleri' AS nvarchar(max)), nchar(10), N'Temel Solfej ve Nota Bilgisi', nchar(10), N'Yöre Tavırları ve Ezgi Yapıları', nchar(10), N'Halk Müziği Repertuvar Oluşturma', nchar(10), N'Kulaktan Çalma ve Duyuş Gelişimi'), 4, 520.0, 15, N'Temel bilgisayar kullanımı.', '2026-06-01T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(10, 5, N'Modern Yoga ve Klinik Pilates', CONCAT(CAST(N'Hafta 1: Temel Nefes ve Isınma Hareketleri' AS nvarchar(max)), nchar(10), N'Hafta 2: Yoga Başlangıç Serileri (Asanalar)', nchar(10), N'Hafta 3: Pilates Temel Prensipleri ve Mat', nchar(10), N'Hafta 4: Denge ve Koordinasyon Çalışmaları', nchar(10), N'Hafta 5: İleri Seviye Esneme Hareketleri', nchar(10), N'Hafta 6: Karın ve Sırt Kaslarını Güçlendirme', nchar(10), N'Hafta 7: Derin Gevşeme ve Meditasyon', nchar(10), N'Hafta 8: Kişisel Rutin Oluşturma ve Test'), NULL, NULL, N'Vücudunuzu esnetin, zihninizi dinlendirin. Günlük stresin etkilerinden kurtulurken daha fit ve sağlıklı bir bedene kavuşun. Her yaşa uygun egzersizlerle yaşam kalitenizi artırın.', 36, '2026-07-31T00:00:00.0000000', '12:00:00', '2026-07-28T00:00:00.0000000', N'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Doğru Nefes ve Meditasyon Teknikleri' AS nvarchar(max)), nchar(10), N'Vücut Esnekliği ve Denge Gelişimi', nchar(10), N'Core Bölgesi Güçlendirme (Pilates)', nchar(10), N'Duruş (Postür) Bozukluklarını Düzeltme', nchar(10), N'Zihinsel Odaklanma ve Stres Yönetimi'), 4, 680.0, 25, N'Temel bilgisayar kullanımı.', '2026-05-01T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(11, 6, N'Geleneksel ve Modern Türk Mutfağı', CONCAT(CAST(N'Hafta 1: Mutfak Düzeni ve Güvenliği' AS nvarchar(max)), nchar(10), N'Hafta 2: Kesim Teknikleri ve Ön Hazırlık (Mise en Place)', nchar(10), N'Hafta 3: Çorbalar ve Başlangıç Yemekleri', nchar(10), N'Hafta 4: Osmanlı Saray Mutfağı Lezzetleri', nchar(10), N'Hafta 5: Anadolu''nun Yöresel Yemekleri', nchar(10), N'Hafta 6: Deniz Ürünleri ve Pişirme Yöntemleri', nchar(10), N'Hafta 7: Hamur İşleri ve Mantı Sanatı', nchar(10), N'Hafta 8: Modern Sunum Teknikleri ve Final Menüsü'), NULL, NULL, N'Mutfaktaki yeteneğinizi profesyonelliğe taşıyın. Kebaplardan zeytinyağlılara, saray mutfağından sokak lezzetlerine kadar Türk mutfağının tüm sırlarını uzman şeflerden öğrenin.', 60, '2026-07-30T00:00:00.0000000', '12:00:00', '2026-07-20T00:00:00.0000000', N'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Mutfak Hijyeni ve Bıçak Kullanımı' AS nvarchar(max)), nchar(10), N'Et, Balık ve Kümes Hayvanları İşleme', nchar(10), N'Temel Soslar ve Çorba Teknikleri', nchar(10), N'Zeytinyağlı ve Mezelerin Sırları', nchar(10), N'Tabak Sunumu ve Görsel Sanat'), 4, 720.0, 18, N'Temel bilgisayar kullanımı.', '2026-05-10T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(12, 6, N'Profesyonel Pastacılık ve Ekmekçilik', CONCAT(CAST(N'Hafta 1: Pastacılık Malzemeleri ve Hijyen' AS nvarchar(max)), nchar(10), N'Hafta 2: Pandispanya ve Temel Kekler', nchar(10), N'Hafta 3: Pasta Kremaları ve Ganaj Yapımı', nchar(10), N'Hafta 4: Şeker Hamuru ile Figür Tasarımı', nchar(10), N'Hafta 5: Tartlar, Kişler ve Kurabiyeler', nchar(10), N'Hafta 6: Mayalı Hamurlar ve Açma/Poğaça', nchar(10), N'Hafta 7: Dünya Tatlıları (Tiramisu, Cheesecake)', nchar(10), N'Hafta 8: Katlı Pasta Yapımı ve Sunum'), NULL, NULL, N'Tatlı bir kariyer başlangıcı yapın! Pasta süsleme tekniklerinden artisan ekmek yapımına kadar her şeyi uygulamalı olarak göreceksiniz. Kendi butik pastanenizi açma hayalinize bir adım daha yaklaşın.', 50, '2026-08-15T00:00:00.0000000', '12:00:00', '2026-08-10T00:00:00.0000000', N'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Temel Hamur ve Krema Teknikleri' AS nvarchar(max)), nchar(10), N'Butik Pasta Tasarımı ve Süsleme', nchar(10), N'Artisan (Ekşi Mayalı) Ekmek Yapımı', nchar(10), N'Çikolata İşleme ve Şeker Sanatı', nchar(10), N'Maliyet Hesaplama ve İşletme Bilgisi'), 4, 840.0, 15, N'Temel bilgisayar kullanımı.', '2026-06-01T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(13, 7, N'Güzellik ve Cilt Bakım Teknikleri', CONCAT(CAST(N'Hafta 1: Anatomi, Fizyoloji ve Hijyen' AS nvarchar(max)), nchar(10), N'Hafta 2: Cilt Tipleri ve Bakım Ürünleri', nchar(10), N'Hafta 3: Yüz Masajı ve Lenf Drenaj', nchar(10), N'Hafta 4: Klasik ve Modern Makyaj Teknikleri', nchar(10), N'Hafta 5: Kaş ve Kirpik Tasarımı', nchar(10), N'Hafta 6: Vücut Bakımı ve Selülit Tedavileri', nchar(10), N'Hafta 7: El ve Ayak Bakımı (Manikür/Pedikür)', nchar(10), N'Hafta 8: Sektörel Trendler ve İş Bulma Stratejileri'), NULL, NULL, N'Profesyonel bir estetisyen olma yolunda ilk adımınızı atın. Cilt analizinden makyaj tekniklerine, masajdan epilasyona kadar geniş bir yelpazede uzmanlaşın. Güzellik sektörünün parlayan yıldızı olun.', 72, '2026-08-15T00:00:00.0000000', '12:00:00', '2026-08-05T00:00:00.0000000', N'https://images.unsplash.com/photo-1560750588-73207b1ef5b8?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Detaylı Cilt Analizi ve Teşhis' AS nvarchar(max)), nchar(10), N'Profesyonel Makyaj ve Kontürleme', nchar(10), N'Temel Masaj ve Rahatlama Teknikleri', nchar(10), N'Epilasyon ve Depilasyon Yöntemleri', nchar(10), N'Müşteri İlişkileri ve Salon Yönetimi'), 6, 950.0, 12, N'Temel bilgisayar kullanımı.', '2026-05-15T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(14, 8, N'Dijital Muhasebe ve Ön Muhasebe Uzmanlığı', CONCAT(CAST(N'Hafta 1: Temel Muhasebe Kavramları' AS nvarchar(max)), nchar(10), N'Hafta 2: Bilanço ve Gelir Tablosu Yapısı', nchar(10), N'Hafta 3: Ticari Belgeler ve Kayıt Düzeni', nchar(10), N'Hafta 4: Bilgisayarlı Muhasebe Giriş', nchar(10), N'Hafta 5: Cari Hesap ve Stok Takibi', nchar(10), N'Hafta 6: KDV, Muhtasar ve Vergi İşlemleri', nchar(10), N'Hafta 7: Personel Özlük İşleri ve Bordrolama', nchar(10), N'Hafta 8: Dönem Sonu İşlemleri ve Kapanış'), NULL, NULL, N'Şirketlerin finansal dilini öğrenin. Bilgisayarlı muhasebe programları ve güncel mevzuat eğitimi ile iş dünyasının aranan personeli olun. Finansal okuryazarlığınızı zirveye taşıyın.', 90, '2026-08-01T00:00:00.0000000', '12:00:00', '2026-07-25T00:00:00.0000000', N'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'Tek Düzen Hesap Planı ve Mantığı' AS nvarchar(max)), nchar(10), N'Fatura, Çek, Senet ve Bordro İşlemleri', nchar(10), N'LOGO ve Zirve Muhasebe Programları', nchar(10), N'Vergi Mevzuatı ve Beyanname Süreçleri', nchar(10), N'Finansal Analiz ve Raporlama Yetisi'), 4, 760.0, 30, N'Temel bilgisayar kullanımı.', '2026-05-01T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(15, 8, N'Dijital Girişimcilik ve E-Ticaret Atölyesi', CONCAT(CAST(N'Hafta 1: Girişimcilik Temelleri ve Fikir Doğrulama' AS nvarchar(max)), nchar(10), N'Hafta 2: İş Planı ve Stratejik Yol Haritası', nchar(10), N'Hafta 3: E-Ticaret Platformları ve Kurulum', nchar(10), N'Hafta 4: Dijital Pazarlama ve SEO Giriş', nchar(10), N'Hafta 5: İçerik Üretimi ve Sosyal Medya Yönetimi', nchar(10), N'Hafta 6: Ödeme Sistemleri ve Lojistik Yönetimi', nchar(10), N'Hafta 7: Teşvikler, Hibeler ve Şirketleşme', nchar(10), N'Hafta 8: Demo Day: Proje Sunumları ve Sertifika'), NULL, NULL, N'Kendi işinizin patronu olun! Fikrinizi bir iş planına dönüştürmekten e-ticaret sitenizi kurmaya kadar her adımı birlikte atıyoruz. Girişimcilik ekosisteminde fark yaratacak stratejiler geliştirin.', 40, '2026-08-15T00:00:00.0000000', '12:00:00', '2026-08-10T00:00:00.0000000', N'https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'İş Modeli Kanvası ve Strateji Oluşturma' AS nvarchar(max)), nchar(10), N'E-Ticaret Altyapıları ve Pazaryeri Yönetimi', nchar(10), N'Dijital Pazarlama ve Sosyal Medya Reklamcılığı', nchar(10), N'Finansal Planlama ve Yatırımcı Sunumu', nchar(10), N'Marka Tescil ve Hukuki Süreçler'), 4, 590.0, 25, N'Temel bilgisayar kullanımı.', '2026-06-15T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.'),
(16, 1, N'Siber Güvenlik ve Ağ Temelleri', CONCAT(CAST(N'Hafta 1: Ağ Temelleri ve TCP/IP' AS nvarchar(max)), nchar(10), N'Hafta 2: Bilgi Toplama ve Keşif Teknikleri', nchar(10), N'Hafta 3: Sistem Güvenliği ve Sıkılaştırma', nchar(10), N'Hafta 4: Web Uygulama Güvenliği', nchar(10), N'Hafta 5: Kablosuz Ağ Güvenliği', nchar(10), N'Hafta 6: Sosyal Mühendislik ve İnsan Faktörü', nchar(10), N'Hafta 7: Olay Müdahale ve Adli Bilişim', nchar(10), N'Hafta 8: Final Laboratuvar Uygulaması'), NULL, NULL, N'Dijital dünyayı korumayı öğrenin! Ağ güvenliğinden etik hackerlığa kadar geniş bir yelpazede temel eğitim alın. Siber tehditlere karşı nasıl savunma yapacağınızı uzmanından dinleyin.', 64, '2026-11-01T00:00:00.0000000', '12:00:00', '2026-10-28T00:00:00.0000000', N'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600', CAST(1 AS bit), CAST(0 AS bit), CONCAT(CAST(N'TCP/IP ve Ağ Protokolleri Bilgisi' AS nvarchar(max)), nchar(10), N'Sızma Testi (Pentest) Temelleri', nchar(10), N'Etik Hackerlık Etik ve Teknikleri', nchar(10), N'Sistem ve Veri Güvenliği Stratejileri', nchar(10), N'Siber Olaylara Müdahale Yöntemleri'), 6, 0.0, 20, N'Temel bilgisayar kullanımı.', '2026-09-01T00:00:00.0000000', '09:00:00', N'Kendini geliştirmek isteyen herkes.');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CategoryId', N'CourseName', N'Curriculum', N'DeletedAt', N'DeletedBy', N'Description', N'DurationHours', N'EndDate', N'EndTime', N'ExamDate', N'ImageUrl', N'IsActive', N'IsDeleted', N'LearningOutcomes', N'MaxAbsenceLimit', N'Price', N'Quota', N'Requirements', N'StartDate', N'StartTime', N'WhoIsItFor') AND [object_id] = OBJECT_ID(N'[Courses]'))
    SET IDENTITY_INSERT [Courses] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AdminNote', N'ApplyDate', N'BirthPlace', N'CertificateCode', N'CourseId', N'DateOfBirth', N'DeletedAt', N'DeletedBy', N'EducationLevel', N'Email', N'ExamGrade', N'FirstName', N'IsCompleted', N'IsDeleted', N'IsPaid', N'LastName', N'PaymentMethod', N'PhoneNumber', N'Status', N'StudentId', N'TcNo', N'TransactionId') AND [object_id] = OBJECT_ID(N'[Applications]'))
    SET IDENTITY_INSERT [Applications] ON;
INSERT INTO [Applications] ([Id], [AdminNote], [ApplyDate], [BirthPlace], [CertificateCode], [CourseId], [DateOfBirth], [DeletedAt], [DeletedBy], [EducationLevel], [Email], [ExamGrade], [FirstName], [IsCompleted], [IsDeleted], [IsPaid], [LastName], [PaymentMethod], [PhoneNumber], [Status], [StudentId], [TcNo], [TransactionId])
VALUES (1, NULL, '2026-01-02T00:00:00.0000000', NULL, N'HE-2026-0001', 1, '1990-01-01T00:00:00.0000000', NULL, NULL, N'Üniversite', N'ali.koc@email.com', NULL, N'Ali', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Koç', NULL, N'0532 111 22 33', 1, NULL, N'12345678901', NULL),
(2, NULL, '2026-02-03T00:00:00.0000000', NULL, N'HE-2026-0002', 4, '1992-05-10T00:00:00.0000000', NULL, NULL, N'Lise', N'ayse.demir@email.com', NULL, N'Ayşe', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Demir', NULL, N'0533 222 33 44', 1, NULL, N'23456789012', NULL),
(3, NULL, '2026-04-04T00:00:00.0000000', NULL, NULL, 8, '1988-12-20T00:00:00.0000000', NULL, NULL, N'Üniversite', N'mehmet.yilmaz@email.com', NULL, N'Mehmet', CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Yılmaz', NULL, N'0534 333 44 55', 0, NULL, N'34567890123', NULL),
(4, NULL, '2026-04-05T00:00:00.0000000', NULL, NULL, 11, '1993-08-25T00:00:00.0000000', NULL, NULL, N'Ön Lisans', N'fatma.kara@email.com', NULL, N'Fatma', CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Kara', NULL, N'0535 444 55 66', 0, NULL, N'45678901234', NULL),
(5, N'Kontenjan doldu.', '2026-04-05T00:00:00.0000000', NULL, NULL, 2, '1991-11-30T00:00:00.0000000', NULL, NULL, N'Lise', N'hasan.celik@email.com', NULL, N'Hasan', CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Çelik', NULL, N'0536 555 66 77', 2, NULL, N'56789012345', NULL),
(6, NULL, '2026-04-06T00:00:00.0000000', NULL, NULL, 10, '1994-02-14T00:00:00.0000000', NULL, NULL, N'Üniversite', N'zeynep.aydin@email.com', NULL, N'Zeynep', CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Aydın', NULL, N'0537 666 77 88', 1, NULL, N'67890123456', NULL),
(7, NULL, '2026-04-07T00:00:00.0000000', NULL, NULL, 13, '1996-06-20T00:00:00.0000000', NULL, NULL, N'Lise', N'emre.sahin@email.com', NULL, N'Emre', CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Şahin', NULL, N'0538 777 88 99', 0, NULL, N'78901234567', NULL),
(8, NULL, '2026-04-07T00:00:00.0000000', NULL, NULL, 14, '1995-03-15T00:00:00.0000000', NULL, NULL, N'Üniversite', N'derya.ozturk@email.com', NULL, N'Derya', CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Öztürk', NULL, N'0539 888 99 00', 1, NULL, N'89012345678', NULL),
(16, NULL, '2026-05-01T00:00:00.0000000', NULL, NULL, 16, '1998-04-10T00:00:00.0000000', NULL, NULL, N'Üniversite', N'hakan@email.com', NULL, N'Hakan', CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Yılmaz', NULL, N'0541 000 11 22', 1, NULL, N'11122233344', NULL),
(17, NULL, '2026-05-01T00:00:00.0000000', NULL, NULL, 16, '2000-10-15T00:00:00.0000000', NULL, NULL, N'Üniversite', N'selin@email.com', NULL, N'Selin', CAST(0 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'Demir', NULL, N'0541 000 11 33', 1, NULL, N'22233344455', NULL);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AdminNote', N'ApplyDate', N'BirthPlace', N'CertificateCode', N'CourseId', N'DateOfBirth', N'DeletedAt', N'DeletedBy', N'EducationLevel', N'Email', N'ExamGrade', N'FirstName', N'IsCompleted', N'IsDeleted', N'IsPaid', N'LastName', N'PaymentMethod', N'PhoneNumber', N'Status', N'StudentId', N'TcNo', N'TransactionId') AND [object_id] = OBJECT_ID(N'[Applications]'))
    SET IDENTITY_INSERT [Applications] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CourseId', N'CreatedAt', N'Rating', N'UserEmail') AND [object_id] = OBJECT_ID(N'[Comments]'))
    SET IDENTITY_INSERT [Comments] ON;
INSERT INTO [Comments] ([Id], [Content], [CourseId], [CreatedAt], [Rating], [UserEmail])
VALUES (1, N'Python kursu gerçekten harika! Yapay zeka projeleri çok etkileyici.', 1, '2026-04-20T00:00:00.0000000', 5, N'ali@mail.com'),
(2, N'İçerik çok yoğun, bazı kısımları anlamak için tekrar izlemem gerekti. Biraz daha yavaş ilerleyebilirdi.', 1, '2026-04-25T00:00:00.0000000', 3, N'selin@mail.com'),
(3, N'Web tasarım kursunda öğrendiğim tekniklerle kendi portfolyomu oluşturdum. Teşekkürler!', 2, '2026-04-28T00:00:00.0000000', 5, N'murat@mail.com'),
(4, N'Gitar çalmayı hep istiyordum, bu kurs sayesinde ilk şarkımı çaldım. Eğitmen çok ilgili.', 8, '2026-04-15T00:00:00.0000000', 5, N'deniz@mail.com'),
(5, N'Pastacılık kursu güzel ama mutfak biraz kalabalıktı. Daha küçük gruplar olsa daha iyi olurdu.', 12, '2026-04-22T00:00:00.0000000', 3, N'buse@mail.com'),
(6, N'Hocanın anlatımı çok teknik kalıyor, yeni başlayanlar zorlanabilir.', 1, '2026-04-29T00:00:00.0000000', 2, N'hakan@mail.com');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CourseId', N'CreatedAt', N'Rating', N'UserEmail') AND [object_id] = OBJECT_ID(N'[Comments]'))
    SET IDENTITY_INSERT [Comments] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CourseId', N'FilePath', N'FileType', N'Title', N'UploadDate') AND [object_id] = OBJECT_ID(N'[CourseResources]'))
    SET IDENTITY_INSERT [CourseResources] ON;
INSERT INTO [CourseResources] ([Id], [CourseId], [FilePath], [FileType], [Title], [UploadDate])
VALUES (1, 1, N'#', N'PDF/Döküman', N'1. Hafta: Python Kurulumu ve Geliştirme Ortamı', '2026-03-01T00:00:00.0000000'),
(2, 1, N'#', N'PDF/Döküman', N'2. Hafta: Değişkenler ve Veri Tipleri', '2026-03-08T00:00:00.0000000'),
(3, 1, N'#', N'PDF/Döküman', N'3. Hafta: Döngüler ve Karar Yapıları', '2026-03-15T00:00:00.0000000'),
(4, 1, N'#', N'PDF/Döküman', N'4. Hafta: Fonksiyonlar ve Kapsam', '2026-03-22T00:00:00.0000000'),
(5, 1, N'#', N'PDF/Döküman', N'5. Hafta: Hata Yönetimi ve Dosyalama', '2026-03-29T00:00:00.0000000'),
(6, 1, N'#', N'PDF/Döküman', N'6. Hafta: Numpy ve Pandas Giriş', '2026-04-05T00:00:00.0000000'),
(7, 1, N'#', N'PDF/Döküman', N'7. Hafta: Scikit-Learn ile Veri Tahmini', '2026-04-12T00:00:00.0000000'),
(8, 1, N'#', N'PDF/Döküman', N'8. Hafta: Bitirme Projesi Sunumu', '2026-04-19T00:00:00.0000000'),
(9, 2, N'#', N'PDF/Döküman', N'1. Hafta: HTML5 Semantik Yapı', '2026-03-01T00:00:00.0000000'),
(10, 2, N'#', N'PDF/Döküman', N'2. Hafta: CSS3 Tasarım ve Grid', '2026-03-08T00:00:00.0000000'),
(11, 2, N'#', N'PDF/Döküman', N'3. Hafta: Responsive Tasarım Prensipleri', '2026-03-15T00:00:00.0000000'),
(12, 2, N'#', N'PDF/Döküman', N'4. Hafta: JavaScript Temelleri', '2026-03-22T00:00:00.0000000'),
(13, 2, N'#', N'PDF/Döküman', N'5. Hafta: DOM ve Eventler', '2026-03-29T00:00:00.0000000'),
(14, 2, N'#', N'PDF/Döküman', N'6. Hafta: Modern JS ve ES6+', '2026-04-05T00:00:00.0000000'),
(15, 2, N'#', N'PDF/Döküman', N'7. Hafta: React Bileşen Yapısı', '2026-04-12T00:00:00.0000000'),
(16, 2, N'#', N'PDF/Döküman', N'8. Hafta: Web Sitesi Yayınlama', '2026-04-19T00:00:00.0000000'),
(17, 3, N'#', N'PDF/Döküman', N'1. Hafta: Donanım ve Windows 11', '2026-03-01T00:00:00.0000000'),
(18, 3, N'#', N'PDF/Döküman', N'2. Hafta: Word ile Rapor Hazırlama', '2026-03-08T00:00:00.0000000'),
(19, 3, N'#', N'PDF/Döküman', N'3. Hafta: Excel Temel Formüller', '2026-03-15T00:00:00.0000000'),
(20, 3, N'#', N'PDF/Döküman', N'4. Hafta: Excel Veri Analizi', '2026-03-22T00:00:00.0000000'),
(21, 3, N'#', N'PDF/Döküman', N'5. Hafta: PowerPoint Sunum Teknikleri', '2026-03-29T00:00:00.0000000'),
(22, 3, N'#', N'PDF/Döküman', N'6. Hafta: Outlook ve Bulut Sistemleri', '2026-04-05T00:00:00.0000000'),
(23, 3, N'#', N'PDF/Döküman', N'7. Hafta: Siber Güvenlik Farkındalığı', '2026-04-12T00:00:00.0000000'),
(24, 3, N'#', N'PDF/Döküman', N'8. Hafta: Ofis Yazılımları Sınavı', '2026-04-19T00:00:00.0000000'),
(25, 4, N'#', N'PDF/Döküman', N'1. Hafta: Selamlaşma ve Alfabe', '2026-03-01T00:00:00.0000000'),
(26, 4, N'#', N'PDF/Döküman', N'2. Hafta: Şimdiki Zaman Cümleleri', '2026-03-08T00:00:00.0000000'),
(27, 4, N'#', N'PDF/Döküman', N'3. Hafta: Geçmiş Zaman ve Hikaye', '2026-03-15T00:00:00.0000000'),
(28, 4, N'#', N'PDF/Döküman', N'4. Hafta: Gelecek Zaman ve Planlar', '2026-03-22T00:00:00.0000000'),
(29, 4, N'#', N'PDF/Döküman', N'5. Hafta: Sıfatlar ve Karşılaştırmalar', '2026-03-29T00:00:00.0000000'),
(30, 4, N'#', N'PDF/Döküman', N'6. Hafta: İş ve Sosyal Hayat', '2026-04-05T00:00:00.0000000'),
(31, 4, N'#', N'PDF/Döküman', N'7. Hafta: Seyahat ve Kültür', '2026-04-12T00:00:00.0000000'),
(32, 4, N'#', N'PDF/Döküman', N'8. Hafta: Konuşma ve Dinleme Testi', '2026-04-19T00:00:00.0000000'),
(33, 5, N'#', N'PDF/Döküman', N'1. Hafta: Almanca Sesletim Kuralları', '2026-03-01T00:00:00.0000000'),
(34, 5, N'#', N'PDF/Döküman', N'2. Hafta: Temel Tanışma Kalıpları', '2026-03-08T00:00:00.0000000'),
(35, 5, N'#', N'PDF/Döküman', N'3. Hafta: Düzenli ve Düzensiz Fiiller', '2026-03-15T00:00:00.0000000'),
(36, 5, N'#', N'PDF/Döküman', N'4. Hafta: Zamirler ve İsim Halleri', '2026-03-22T00:00:00.0000000'),
(37, 5, N'#', N'PDF/Döküman', N'5. Hafta: Zaman Zarfları ve Saatler', '2026-03-29T00:00:00.0000000'),
(38, 5, N'#', N'PDF/Döküman', N'6. Hafta: Günlük Aktiviteler', '2026-04-05T00:00:00.0000000'),
(39, 5, N'#', N'PDF/Döküman', N'7. Hafta: Yiyecek ve İçecekler', '2026-04-12T00:00:00.0000000'),
(40, 5, N'#', N'PDF/Döküman', N'8. Hafta: Genel A1 Tekrarı', '2026-04-19T00:00:00.0000000'),
(41, 6, N'#', N'PDF/Döküman', N'1. Hafta: Fırça ve Boya Çeşitleri', '2026-03-01T00:00:00.0000000'),
(42, 6, N'#', N'PDF/Döküman', N'2. Hafta: Ahşap Hazırlama Teknikleri', '2026-03-08T00:00:00.0000000');
INSERT INTO [CourseResources] ([Id], [CourseId], [FilePath], [FileType], [Title], [UploadDate])
VALUES (43, 6, N'#', N'PDF/Döküman', N'3. Hafta: Zımpara ve Astar Atma', '2026-03-15T00:00:00.0000000'),
(44, 6, N'#', N'PDF/Döküman', N'4. Hafta: Akrilik Boyama Sanatı', '2026-03-22T00:00:00.0000000'),
(45, 6, N'#', N'PDF/Döküman', N'5. Hafta: Eskitme ve Patina', '2026-03-29T00:00:00.0000000'),
(46, 6, N'#', N'PDF/Döküman', N'6. Hafta: Dekupaj ve Transfer', '2026-04-05T00:00:00.0000000'),
(47, 6, N'#', N'PDF/Döküman', N'7. Hafta: Vernikleme ve Koruma', '2026-04-12T00:00:00.0000000'),
(48, 6, N'#', N'PDF/Döküman', N'8. Hafta: Yıl Sonu Sergi Ürünü', '2026-04-19T00:00:00.0000000'),
(49, 7, N'#', N'PDF/Döküman', N'1. Hafta: Çamur Türleri ve Hazırlama', '2026-03-01T00:00:00.0000000'),
(50, 7, N'#', N'PDF/Döküman', N'2. Hafta: Elde Şekillendirme: Fitil', '2026-03-08T00:00:00.0000000'),
(51, 7, N'#', N'PDF/Döküman', N'3. Hafta: Plaka Yöntemi ile Formlar', '2026-03-15T00:00:00.0000000'),
(52, 7, N'#', N'PDF/Döküman', N'4. Hafta: Çimdikleme ve Kase Tasarımı', '2026-03-22T00:00:00.0000000'),
(53, 7, N'#', N'PDF/Döküman', N'5. Hafta: Kuruma ve Rötuş Safhaları', '2026-03-29T00:00:00.0000000'),
(54, 7, N'#', N'PDF/Döküman', N'6. Hafta: Sır Altı Boyama', '2026-04-05T00:00:00.0000000'),
(55, 7, N'#', N'PDF/Döküman', N'7. Hafta: Sırlama Teknikleri', '2026-04-12T00:00:00.0000000'),
(56, 7, N'#', N'PDF/Döküman', N'8. Hafta: Fırınlama ve Teslim', '2026-04-19T00:00:00.0000000'),
(57, 8, N'#', N'PDF/Döküman', N'1. Hafta: Gitar Tutuşu ve Akort', '2026-03-01T00:00:00.0000000'),
(58, 8, N'#', N'PDF/Döküman', N'2. Hafta: Notaların Klavyedeki Yeri', '2026-03-08T00:00:00.0000000'),
(59, 8, N'#', N'PDF/Döküman', N'3. Hafta: Temel Akorlar ve Geçişler', '2026-03-15T00:00:00.0000000'),
(60, 8, N'#', N'PDF/Döküman', N'4. Hafta: Ritim ve Vuruş Kalıpları', '2026-03-22T00:00:00.0000000'),
(61, 8, N'#', N'PDF/Döküman', N'5. Hafta: Arpej ve Parmak Stili', '2026-03-29T00:00:00.0000000'),
(62, 8, N'#', N'PDF/Döküman', N'6. Hafta: Bareli Akorlara Giriş', '2026-04-05T00:00:00.0000000'),
(63, 8, N'#', N'PDF/Döküman', N'7. Hafta: Solo ve Gam Pratikleri', '2026-04-12T00:00:00.0000000'),
(64, 8, N'#', N'PDF/Döküman', N'8. Hafta: Popüler Şarkı İcrası', '2026-04-19T00:00:00.0000000'),
(65, 9, N'#', N'PDF/Döküman', N'1. Hafta: Bağlama Düzeni ve Tutuş', '2026-03-01T00:00:00.0000000'),
(66, 9, N'#', N'PDF/Döküman', N'2. Hafta: Solfej ve Nota Okuma', '2026-03-08T00:00:00.0000000'),
(67, 9, N'#', N'PDF/Döküman', N'3. Hafta: Tezene (Mızrap) Vuruşları', '2026-03-15T00:00:00.0000000'),
(68, 9, N'#', N'PDF/Döküman', N'4. Hafta: Alt Tel Egzersizleri', '2026-03-22T00:00:00.0000000'),
(69, 9, N'#', N'PDF/Döküman', N'5. Hafta: Orta ve Üst Tel Kullanımı', '2026-03-29T00:00:00.0000000'),
(70, 9, N'#', N'PDF/Döküman', N'6. Hafta: Basit Halk Ezgileri', '2026-04-05T00:00:00.0000000'),
(71, 9, N'#', N'PDF/Döküman', N'7. Hafta: Tavır ve Üslup Çalışması', '2026-04-12T00:00:00.0000000'),
(72, 9, N'#', N'PDF/Döküman', N'8. Hafta: Repertuvar ve Sınav', '2026-04-19T00:00:00.0000000'),
(73, 10, N'#', N'PDF/Döküman', N'1. Hafta: Yoga ve Nefes Egzersizleri', '2026-03-01T00:00:00.0000000'),
(74, 10, N'#', N'PDF/Döküman', N'2. Hafta: Güneşe Selam ve Asanalar', '2026-03-08T00:00:00.0000000'),
(75, 10, N'#', N'PDF/Döküman', N'3. Hafta: Duruş ve Postür Analizi', '2026-03-15T00:00:00.0000000'),
(76, 10, N'#', N'PDF/Döküman', N'4. Hafta: Core Bölgesi Gelişimi', '2026-03-22T00:00:00.0000000'),
(77, 10, N'#', N'PDF/Döküman', N'5. Hafta: Esneklik ve Güç Dengesi', '2026-03-29T00:00:00.0000000'),
(78, 10, N'#', N'PDF/Döküman', N'6. Hafta: Klinik Pilates Mat Egzersizleri', '2026-04-05T00:00:00.0000000'),
(79, 10, N'#', N'PDF/Döküman', N'7. Hafta: Meditasyon ve Gevşeme', '2026-04-12T00:00:00.0000000'),
(80, 10, N'#', N'PDF/Döküman', N'8. Hafta: Kişisel Gelişim Planı', '2026-04-19T00:00:00.0000000'),
(81, 11, N'#', N'PDF/Döküman', N'1. Hafta: Mutfak Ekipmanları ve Hijyen', '2026-03-01T00:00:00.0000000'),
(82, 11, N'#', N'PDF/Döküman', N'2. Hafta: Profesyonel Bıçak Kullanımı', '2026-03-08T00:00:00.0000000'),
(83, 11, N'#', N'PDF/Döküman', N'3. Hafta: Temel Çorba ve Soslar', '2026-03-15T00:00:00.0000000'),
(84, 11, N'#', N'PDF/Döküman', N'4. Hafta: Et ve Sebze Pişirme', '2026-03-22T00:00:00.0000000');
INSERT INTO [CourseResources] ([Id], [CourseId], [FilePath], [FileType], [Title], [UploadDate])
VALUES (85, 11, N'#', N'PDF/Döküman', N'5. Hafta: Hamur İşleri ve Mantı', '2026-03-29T00:00:00.0000000'),
(86, 11, N'#', N'PDF/Döküman', N'6. Hafta: Zeytinyağlılar ve Mezeler', '2026-04-05T00:00:00.0000000'),
(87, 11, N'#', N'PDF/Döküman', N'7. Hafta: Osmanlı Saray Yemekleri', '2026-04-12T00:00:00.0000000'),
(88, 11, N'#', N'PDF/Döküman', N'8. Hafta: Modern Sunum Sanatı', '2026-04-19T00:00:00.0000000'),
(89, 12, N'#', N'PDF/Döküman', N'1. Hafta: Pasta Malzemeleri Tanıtımı', '2026-03-01T00:00:00.0000000'),
(90, 12, N'#', N'PDF/Döküman', N'2. Hafta: Pandispanya ve Kekler', '2026-03-08T00:00:00.0000000'),
(91, 12, N'#', N'PDF/Döküman', N'3. Hafta: Pastacı Kreması Yapımı', '2026-03-15T00:00:00.0000000'),
(92, 12, N'#', N'PDF/Döküman', N'4. Hafta: Şeker Hamuru ve Figür', '2026-03-22T00:00:00.0000000'),
(93, 12, N'#', N'PDF/Döküman', N'5. Hafta: Tart ve Kurabiyeler', '2026-03-29T00:00:00.0000000'),
(94, 12, N'#', N'PDF/Döküman', N'6. Hafta: Çikolata ve Tatlılar', '2026-04-05T00:00:00.0000000'),
(95, 12, N'#', N'PDF/Döküman', N'7. Hafta: Katlı Pasta Tasarımı', '2026-04-12T00:00:00.0000000'),
(96, 12, N'#', N'PDF/Döküman', N'8. Hafta: Vitrin Pastacılığı', '2026-04-19T00:00:00.0000000'),
(97, 13, N'#', N'PDF/Döküman', N'1. Hafta: Saç Anatomisi ve Analizi', '2026-03-01T00:00:00.0000000'),
(98, 13, N'#', N'PDF/Döküman', N'2. Hafta: Hijyen ve Müşteri İlişkileri', '2026-03-08T00:00:00.0000000'),
(99, 13, N'#', N'PDF/Döküman', N'3. Hafta: Temel Kesim Teknikleri', '2026-03-15T00:00:00.0000000'),
(100, 13, N'#', N'PDF/Döküman', N'4. Hafta: Fön ve Şekillendirme', '2026-03-22T00:00:00.0000000'),
(101, 13, N'#', N'PDF/Döküman', N'5. Hafta: Boya ve Renk Teorisi', '2026-03-29T00:00:00.0000000'),
(102, 13, N'#', N'PDF/Döküman', N'6. Hafta: Modern Renklendirme', '2026-04-05T00:00:00.0000000'),
(103, 13, N'#', N'PDF/Döküman', N'7. Hafta: Topuz ve Gelin Saçı', '2026-04-12T00:00:00.0000000'),
(104, 13, N'#', N'PDF/Döküman', N'8. Hafta: Salon Yönetimi', '2026-04-19T00:00:00.0000000'),
(105, 14, N'#', N'PDF/Döküman', N'1. Hafta: Tek Düzen Hesap Planı', '2026-03-01T00:00:00.0000000'),
(106, 14, N'#', N'PDF/Döküman', N'2. Hafta: Fatura ve İrsaliye Kaydı', '2026-03-08T00:00:00.0000000'),
(107, 14, N'#', N'PDF/Döküman', N'3. Hafta: Banka ve Kasa İşlemleri', '2026-03-15T00:00:00.0000000'),
(108, 14, N'#', N'PDF/Döküman', N'4. Hafta: Cari Hesap Takibi', '2026-03-22T00:00:00.0000000'),
(109, 14, N'#', N'PDF/Döküman', N'5. Hafta: Vergi ve Beyannameler', '2026-03-29T00:00:00.0000000'),
(110, 14, N'#', N'PDF/Döküman', N'6. Hafta: Personel ve Bordrolama', '2026-04-05T00:00:00.0000000'),
(111, 14, N'#', N'PDF/Döküman', N'7. Hafta: Bilgisayarlı Muhasebe', '2026-04-12T00:00:00.0000000'),
(112, 14, N'#', N'PDF/Döküman', N'8. Hafta: Yıl Sonu Kapanış', '2026-04-19T00:00:00.0000000'),
(113, 15, N'#', N'PDF/Döküman', N'1. Hafta: Girişimcilik ve İnovasyon', '2026-03-01T00:00:00.0000000'),
(114, 15, N'#', N'PDF/Döküman', N'2. Hafta: İş Modeli Oluşturma', '2026-03-08T00:00:00.0000000'),
(115, 15, N'#', N'PDF/Döküman', N'3. Hafta: E-Ticaret Altyapıları', '2026-03-15T00:00:00.0000000'),
(116, 15, N'#', N'PDF/Döküman', N'4. Hafta: Dijital Pazarlama ve SEO', '2026-03-22T00:00:00.0000000'),
(117, 15, N'#', N'PDF/Döküman', N'5. Hafta: Sosyal Medya Reklamcılığı', '2026-03-29T00:00:00.0000000'),
(118, 15, N'#', N'PDF/Döküman', N'6. Hafta: Ödeme ve Lojistik Sistemi', '2026-04-05T00:00:00.0000000'),
(119, 15, N'#', N'PDF/Döküman', N'7. Hafta: Finansal Planlama', '2026-04-12T00:00:00.0000000'),
(120, 15, N'#', N'PDF/Döküman', N'8. Hafta: Mezuniyet Proje Sunumu', '2026-04-19T00:00:00.0000000');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CourseId', N'FilePath', N'FileType', N'Title', N'UploadDate') AND [object_id] = OBJECT_ID(N'[CourseResources]'))
    SET IDENTITY_INSERT [CourseResources] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArtistName', N'CourseId', N'CreatedAt', N'ExternalLink', N'ImageUrl', N'ModelUrl', N'PositionX', N'PositionY', N'PositionZ', N'RotationY', N'TechDetails', N'Title', N'Type', N'VideoUrl') AND [object_id] = OBJECT_ID(N'[ExhibitionItems]'))
    SET IDENTITY_INSERT [ExhibitionItems] ON;
INSERT INTO [ExhibitionItems] ([Id], [ArtistName], [CourseId], [CreatedAt], [ExternalLink], [ImageUrl], [ModelUrl], [PositionX], [PositionY], [PositionZ], [RotationY], [TechDetails], [Title], [Type], [VideoUrl])
VALUES (1, N'Emine Yılmaz', 6, '2026-05-02T18:23:13.6663623+03:00', NULL, N'/images/exhibition/lace.png', NULL, CAST(0 AS real), CAST(1.6 AS real), CAST(-6 AS real), CAST(0 AS real), NULL, N'Zarif Çeyizlik Dantel', 0, NULL),
(2, N'Fatma Demir', 7, '2026-05-02T18:23:13.6666665+03:00', NULL, N'/images/exhibition/cini.png', NULL, CAST(5.2 AS real), CAST(1.6 AS real), CAST(-3 AS real), CAST(-60 AS real), NULL, N'Geleneksel Çini Boyama', 0, NULL),
(3, N'Zeynep Kaya', 6, '2026-05-02T18:23:13.6666680+03:00', NULL, N'/images/exhibition/jewelry.png', NULL, CAST(5.2 AS real), CAST(1.6 AS real), CAST(3 AS real), CAST(-120 AS real), NULL, N'Altın İşlemeli Nakış', 0, NULL),
(4, N'Ömer Çelik', 7, '2026-05-02T18:23:13.6666687+03:00', NULL, N'/images/exhibition/wood_carving.png', NULL, CAST(0 AS real), CAST(1.6 AS real), CAST(6 AS real), CAST(180 AS real), NULL, N'Ahşap Oyma Sanatı', 0, NULL),
(5, N'Ayşe Yıldız', 6, '2026-05-02T18:23:13.6666692+03:00', NULL, N'/images/exhibition/jewelry.png', NULL, CAST(-5.2 AS real), CAST(1.6 AS real), CAST(3 AS real), CAST(120 AS real), NULL, N'Gümüş Telkari İşçiliği', 0, NULL),
(6, N'Mehmet Aydın', 7, '2026-05-02T18:23:13.6666698+03:00', NULL, N'/images/exhibition/ebru.png', NULL, CAST(-5.2 AS real), CAST(1.6 AS real), CAST(-3 AS real), CAST(60 AS real), NULL, N'Ebru Sanatı Ustası', 0, NULL);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ArtistName', N'CourseId', N'CreatedAt', N'ExternalLink', N'ImageUrl', N'ModelUrl', N'PositionX', N'PositionY', N'PositionZ', N'RotationY', N'TechDetails', N'Title', N'Type', N'VideoUrl') AND [object_id] = OBJECT_ID(N'[ExhibitionItems]'))
    SET IDENTITY_INSERT [ExhibitionItems] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CourseId', N'CvFilePath', N'DeletedAt', N'DeletedBy', N'FullName', N'ImageUrl', N'IsDeleted', N'Password', N'Title', N'Username') AND [object_id] = OBJECT_ID(N'[Instructors]'))
    SET IDENTITY_INSERT [Instructors] ON;
INSERT INTO [Instructors] ([Id], [CourseId], [CvFilePath], [DeletedAt], [DeletedBy], [FullName], [ImageUrl], [IsDeleted], [Password], [Title], [Username])
VALUES (1, 1, NULL, NULL, NULL, N'Dr. Ahmet Yılmaz', NULL, CAST(0 AS bit), NULL, N'Bilişim Teknolojileri Öğretmeni', NULL),
(2, 2, NULL, NULL, NULL, N'Elif Kaya', NULL, CAST(0 AS bit), NULL, N'Web Tasarım Uzmanı', NULL),
(3, 3, NULL, NULL, NULL, N'Mehmet Demir', NULL, CAST(0 AS bit), NULL, N'Bilgisayar Eğitmeni', NULL),
(4, 4, NULL, NULL, NULL, N'Sarah Johnson', NULL, CAST(0 AS bit), NULL, N'İngilizce Öğretmeni', NULL),
(5, 5, NULL, NULL, NULL, N'Hans Weber', NULL, CAST(0 AS bit), NULL, N'Almanca Öğretmeni', NULL),
(6, 6, NULL, NULL, NULL, N'Zeynep Arslan', NULL, CAST(0 AS bit), NULL, N'El Sanatları Ustası', NULL),
(7, 7, NULL, NULL, NULL, N'Fatma Çelik', NULL, CAST(0 AS bit), NULL, N'Seramik Sanatçısı', NULL),
(8, 8, NULL, NULL, NULL, N'Can Özkan', NULL, CAST(0 AS bit), NULL, N'Müzik Öğretmeni', NULL),
(9, 9, NULL, NULL, NULL, N'Hasan Korkmaz', NULL, CAST(0 AS bit), NULL, N'Halk Müziği Sanatçısı', NULL),
(10, 10, NULL, NULL, NULL, N'Ayşe Yıldırım', NULL, CAST(0 AS bit), NULL, N'Yoga Eğitmeni', NULL),
(11, 11, NULL, NULL, NULL, N'Şef Mustafa Bey', NULL, CAST(0 AS bit), NULL, N'Aşçıbaşı', NULL),
(12, 12, NULL, NULL, NULL, N'Pınar Aydın', NULL, CAST(0 AS bit), NULL, N'Pastacılık Ustası', NULL),
(13, 13, NULL, NULL, NULL, N'Derya Şahin', NULL, CAST(0 AS bit), NULL, N'Kuaför / Güzellik Uzmanı', NULL),
(14, 14, NULL, NULL, NULL, N'Burak Öztürk', NULL, CAST(0 AS bit), NULL, N'Mali Müşavir', NULL),
(15, 15, NULL, NULL, NULL, N'Prof. Dr. Selin Aktaş', NULL, CAST(0 AS bit), NULL, N'Girişimcilik Danışmanı', NULL),
(16, 16, NULL, NULL, NULL, N'Caner Kandemir', NULL, CAST(0 AS bit), N'123', N'Kıdemli Güvenlik Analisti', N'caner');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CourseId', N'CvFilePath', N'DeletedAt', N'DeletedBy', N'FullName', N'ImageUrl', N'IsDeleted', N'Password', N'Title', N'Username') AND [object_id] = OBJECT_ID(N'[Instructors]'))
    SET IDENTITY_INSERT [Instructors] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Day', N'EndTime', N'InstructorId', N'Note', N'StartTime') AND [object_id] = OBJECT_ID(N'[InstructorSchedules]'))
    SET IDENTITY_INSERT [InstructorSchedules] ON;
INSERT INTO [InstructorSchedules] ([Id], [Day], [EndTime], [InstructorId], [Note], [StartTime])
VALUES (1, N'Monday', '12:00:00', 1, N'Python Giriş', '09:00:00');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Day', N'EndTime', N'InstructorId', N'Note', N'StartTime') AND [object_id] = OBJECT_ID(N'[InstructorSchedules]'))
    SET IDENTITY_INSERT [InstructorSchedules] OFF;

CREATE INDEX [IX_Applications_CourseId] ON [Applications] ([CourseId]);

CREATE INDEX [IX_Applications_StudentId] ON [Applications] ([StudentId]);

CREATE INDEX [IX_Attendances_ApplicationId] ON [Attendances] ([ApplicationId]);

CREATE INDEX [IX_Attendances_CourseId] ON [Attendances] ([CourseId]);

CREATE INDEX [IX_Comments_CourseId] ON [Comments] ([CourseId]);

CREATE INDEX [IX_CourseChatMessages_CourseId] ON [CourseChatMessages] ([CourseId]);

CREATE INDEX [IX_CourseResources_CourseId] ON [CourseResources] ([CourseId]);

CREATE INDEX [IX_CourseReviews_CourseId] ON [CourseReviews] ([CourseId]);

CREATE INDEX [IX_CourseReviews_StudentId] ON [CourseReviews] ([StudentId]);

CREATE INDEX [IX_Courses_CategoryId] ON [Courses] ([CategoryId]);

CREATE INDEX [IX_ExhibitionItems_CourseId] ON [ExhibitionItems] ([CourseId]);

CREATE INDEX [IX_GalleryComments_GalleryItemId] ON [GalleryComments] ([GalleryItemId]);

CREATE INDEX [IX_GalleryItems_CourseId] ON [GalleryItems] ([CourseId]);

CREATE INDEX [IX_GalleryLikes_GalleryItemId] ON [GalleryLikes] ([GalleryItemId]);

CREATE INDEX [IX_Instructors_CourseId] ON [Instructors] ([CourseId]);

CREATE INDEX [IX_InstructorSchedules_InstructorId] ON [InstructorSchedules] ([InstructorId]);

CREATE INDEX [IX_Messages_ReceiverInstructorId] ON [Messages] ([ReceiverInstructorId]);

CREATE INDEX [IX_News_CourseId] ON [News] ([CourseId]);

CREATE INDEX [IX_NewsComments_NewsId] ON [NewsComments] ([NewsId]);

CREATE INDEX [IX_NewsLikes_NewsId] ON [NewsLikes] ([NewsId]);

CREATE UNIQUE INDEX [IX_Students_TcNo] ON [Students] ([TcNo]) WHERE [TcNo] IS NOT NULL;

CREATE INDEX [IX_SuccessStories_CourseId] ON [SuccessStories] ([CourseId]);

CREATE INDEX [IX_SuccessStories_StudentId] ON [SuccessStories] ([StudentId]);

CREATE INDEX [IX_TeacherChatMessages_InstructorId] ON [TeacherChatMessages] ([InstructorId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260502152316_InitialModernSetupV2', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:35:53.5459688+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:35:53.5463029+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:35:53.5463039+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:35:53.5463045+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:35:53.5463050+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:35:53.5463055+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CreatedAt', N'GalleryItemId', N'IsApproved', N'IsInstructorResponse', N'UserEmail', N'X', N'Y') AND [object_id] = OBJECT_ID(N'[GalleryComments]'))
    SET IDENTITY_INSERT [GalleryComments] ON;
INSERT INTO [GalleryComments] ([Id], [Content], [CreatedAt], [GalleryItemId], [IsApproved], [IsInstructorResponse], [UserEmail], [X], [Y])
VALUES (1, N'Bu fotoğraf harika çıkmış!', '2026-04-24T18:35:53.5485120+03:00', 1, CAST(1 AS bit), CAST(0 AS bit), N'mine@gmail.com', NULL, NULL),
(2, N'Eğitimler çok verimli geçiyor, belli oluyor.', '2026-04-26T18:35:53.5485483+03:00', 3, CAST(1 AS bit), CAST(0 AS bit), N'nihat@gmail.com', NULL, NULL),
(3, N'El sanatları sergisini kaçırmayın derim.', '2026-04-30T18:35:53.5485490+03:00', 6, CAST(1 AS bit), CAST(0 AS bit), N'oya@gmail.com', NULL, NULL);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CreatedAt', N'GalleryItemId', N'IsApproved', N'IsInstructorResponse', N'UserEmail', N'X', N'Y') AND [object_id] = OBJECT_ID(N'[GalleryComments]'))
    SET IDENTITY_INSERT [GalleryComments] OFF;

UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5441001+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443020+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443031+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443036+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443040+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443043+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443048+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443051+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443055+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443058+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443062+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:35:53.5443065+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedAt', N'GalleryItemId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[GalleryLikes]'))
    SET IDENTITY_INSERT [GalleryLikes] ON;
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1, '2026-04-22T18:35:53.5482089+03:00', 1, N'caner@gmail.com'),
(2, '2026-04-23T18:35:53.5482470+03:00', 1, N'derya@gmail.com'),
(3, '2026-04-24T18:35:53.5482478+03:00', 2, N'elif@gmail.com'),
(4, '2026-04-25T18:35:53.5482483+03:00', 3, N'fatih@gmail.com'),
(5, '2026-04-26T18:35:53.5482489+03:00', 4, N'gamze@gmail.com'),
(6, '2026-04-27T18:35:53.5482494+03:00', 5, N'hande@gmail.com'),
(7, '2026-04-28T18:35:53.5482500+03:00', 6, N'ilker@gmail.com'),
(8, '2026-04-29T18:35:53.5482505+03:00', 7, N'jale@gmail.com'),
(9, '2026-04-30T18:35:53.5482510+03:00', 8, N'kenan@gmail.com'),
(10, '2026-05-01T18:35:53.5482515+03:00', 9, N'leyla@gmail.com');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedAt', N'GalleryItemId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[GalleryLikes]'))
    SET IDENTITY_INSERT [GalleryLikes] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CreatedAt', N'IsApproved', N'NewsId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[NewsComments]'))
    SET IDENTITY_INSERT [NewsComments] ON;
INSERT INTO [NewsComments] ([Id], [Content], [CreatedAt], [IsApproved], [NewsId], [UserEmail])
VALUES (1, N'Kayıtlar için sabırsızlanıyoruz! Çok heyecan verici.', '2026-04-27T18:35:53.5479290+03:00', CAST(1 AS bit), 1, N'merve@gmail.com'),
(2, N'Hangi belgeler gerekiyor acaba? Bilgi verir misiniz?', '2026-04-28T18:35:53.5479664+03:00', CAST(1 AS bit), 1, N'ozan@gmail.com'),
(3, N'Python eğitimi çok kaliteli görünüyor, kesinlikle katılacağım.', '2026-04-30T18:35:53.5479672+03:00', CAST(1 AS bit), 2, N'selin@gmail.com'),
(4, N'Gençler için harika bir fırsat, emeği geçenlere teşekkürler.', '2026-05-01T18:35:53.5479679+03:00', CAST(1 AS bit), 5, N'umut@gmail.com');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CreatedAt', N'IsApproved', N'NewsId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[NewsComments]'))
    SET IDENTITY_INSERT [NewsComments] OFF;

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'NewsId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[NewsLikes]'))
    SET IDENTITY_INSERT [NewsLikes] ON;
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1, 1, N'ayse@gmail.com'),
(2, 1, N'mehmet@gmail.com'),
(3, 1, N'fatma@hotmail.com'),
(4, 2, N'ali@gmail.com'),
(5, 2, N'zeynep@yahoo.com'),
(6, 3, N'can@gmail.com'),
(7, 3, N'asli@gmail.com'),
(8, 3, N'berat@gmail.com'),
(9, 4, N'ece@gmail.com'),
(10, 5, N'hakan@gmail.com');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'NewsId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[NewsLikes]'))
    SET IDENTITY_INSERT [NewsLikes] OFF;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260502153556_AddSocialInteractionsData', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
DELETE FROM [Applications]
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


DELETE FROM [Applications]
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


DELETE FROM [Comments]
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


DELETE FROM [Comments]
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


DELETE FROM [Comments]
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


DELETE FROM [Comments]
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


DELETE FROM [Comments]
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


DELETE FROM [Comments]
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 25;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 26;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 27;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 28;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 29;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 30;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 31;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 32;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 33;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 34;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 35;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 36;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 37;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 38;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 39;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 40;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 41;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 42;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 43;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 44;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 45;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 46;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 47;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 48;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 49;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 50;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 51;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 52;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 53;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 54;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 55;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 56;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 57;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 58;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 59;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 60;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 61;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 62;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 63;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 64;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 65;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 66;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 67;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 68;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 69;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 70;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 71;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 72;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 73;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 74;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 75;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 76;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 77;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 78;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 79;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 80;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 81;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 82;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 83;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 84;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 85;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 86;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 87;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 88;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 89;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 90;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 91;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 92;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 93;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 94;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 95;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 96;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 97;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 98;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 100;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 101;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 102;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 103;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 104;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 105;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 106;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 107;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 108;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 109;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 110;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 111;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 112;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 113;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 114;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 115;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 116;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 117;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 118;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 119;
SELECT @@ROWCOUNT;


DELETE FROM [CourseResources]
WHERE [Id] = 120;
SELECT @@ROWCOUNT;


UPDATE [Certificates] SET [CourseName] = N'İngilizce A1-A2'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Modern Web Tasarım', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Bilgisayar İşletmenliği', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'İngilizce A1-A2', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Almanca A1', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Ahşap Boyama', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Geleneksel Seramik', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Gitar Eğitimi', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Bağlama Kursu', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Yoga ve Pilates', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Türk Mutfağı', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Pastacılık', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Cilt Bakımı', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Dijital Muhasebe', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'E-Ticaret Atölyesi', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [CourseName] = N'Siber Güvenlik', [Curriculum] = N'', [Description] = N'', [ExamDate] = NULL, [LearningOutcomes] = N''
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:46:30.1293305+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:46:30.1300100+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:46:30.1300128+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:46:30.1300136+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:46:30.1300141+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-02T18:46:30.1300146+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [Content] = N'Mükemmel bir eser!', [CreatedAt] = '2026-04-29T18:46:30.1335686+03:00', [UserEmail] = N'sanat@mail.com'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [Content] = N'Görülmeye değer.', [CreatedAt] = '2026-05-01T18:46:30.1336114+03:00', [GalleryItemId] = 1, [UserEmail] = N'ziyaretci@mail.com'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [Content] = N'Mükemmel bir eser!', [CreatedAt] = '2026-04-29T18:46:30.1336403+03:00', [GalleryItemId] = 2, [UserEmail] = N'sanat@mail.com'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CreatedAt', N'GalleryItemId', N'IsApproved', N'IsInstructorResponse', N'UserEmail', N'X', N'Y') AND [object_id] = OBJECT_ID(N'[GalleryComments]'))
    SET IDENTITY_INSERT [GalleryComments] ON;
INSERT INTO [GalleryComments] ([Id], [Content], [CreatedAt], [GalleryItemId], [IsApproved], [IsInstructorResponse], [UserEmail], [X], [Y])
VALUES (4, N'Görülmeye değer.', '2026-05-01T18:46:30.1336408+03:00', 2, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(5, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1336857+03:00', 3, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(6, N'Görülmeye değer.', '2026-05-01T18:46:30.1336863+03:00', 3, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(7, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1337124+03:00', 4, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(8, N'Görülmeye değer.', '2026-05-01T18:46:30.1337127+03:00', 4, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(9, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1337373+03:00', 5, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(10, N'Görülmeye değer.', '2026-05-01T18:46:30.1337391+03:00', 5, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(11, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1337829+03:00', 6, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(12, N'Görülmeye değer.', '2026-05-01T18:46:30.1337832+03:00', 6, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(13, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1338075+03:00', 7, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(14, N'Görülmeye değer.', '2026-05-01T18:46:30.1338078+03:00', 7, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(15, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1338359+03:00', 8, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(16, N'Görülmeye değer.', '2026-05-01T18:46:30.1338362+03:00', 8, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(17, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1338798+03:00', 9, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(18, N'Görülmeye değer.', '2026-05-01T18:46:30.1338810+03:00', 9, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(19, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1339058+03:00', 10, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(20, N'Görülmeye değer.', '2026-05-01T18:46:30.1339061+03:00', 10, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(21, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1339305+03:00', 11, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(22, N'Görülmeye değer.', '2026-05-01T18:46:30.1339308+03:00', 11, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL),
(23, N'Mükemmel bir eser!', '2026-04-29T18:46:30.1339755+03:00', 12, CAST(1 AS bit), CAST(0 AS bit), N'sanat@mail.com', NULL, NULL),
(24, N'Görülmeye değer.', '2026-05-01T18:46:30.1339758+03:00', 12, CAST(1 AS bit), CAST(0 AS bit), N'ziyaretci@mail.com', NULL, NULL);
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CreatedAt', N'GalleryItemId', N'IsApproved', N'IsInstructorResponse', N'UserEmail', N'X', N'Y') AND [object_id] = OBJECT_ID(N'[GalleryComments]'))
    SET IDENTITY_INSERT [GalleryComments] OFF;

UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1281767+03:00', [Description] = N'Temel bilişim eğitimlerimiz.'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285618+03:00', [Description] = N'Grup çalışmaları.'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285641+03:00', [Description] = N'İleri seviye kodlama.'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285646+03:00', [Description] = N'Sanat atölyeleri.'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285650+03:00', [Description] = N'Gurme lezzetler.'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285653+03:00', [Description] = N'Konuşma etkinliği.'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285656+03:00', [Description] = N'Müziğin ritmi.'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285659+03:00', [Description] = N'Klasik müzik yetenekleri.'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285663+03:00', [Description] = N'Zihin ve beden bütünlüğü.'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285667+03:00', [Description] = N'Proje fikirleri.'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285670+03:00', [Description] = N'Mucitler iş başında.'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-02T18:46:30.1285696+03:00', [Description] = N'Dünya mutfakları.'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1331604+03:00', [UserEmail] = N'fan2@halk.com'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333046+03:00', [UserEmail] = N'fan3@halk.com'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333062+03:00', [GalleryItemId] = 1, [UserEmail] = N'fan4@halk.com'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333065+03:00', [GalleryItemId] = 1, [UserEmail] = N'fan5@halk.com'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333069+03:00', [GalleryItemId] = 1, [UserEmail] = N'fan6@halk.com'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333077+03:00', [GalleryItemId] = 1, [UserEmail] = N'fan7@halk.com'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333080+03:00', [GalleryItemId] = 1, [UserEmail] = N'fan8@halk.com'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333083+03:00', [GalleryItemId] = 1, [UserEmail] = N'fan9@halk.com'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333085+03:00', [GalleryItemId] = 1, [UserEmail] = N'fan10@halk.com'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-02T18:46:30.1333092+03:00', [GalleryItemId] = 1, [UserEmail] = N'fan11@halk.com'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedAt', N'GalleryItemId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[GalleryLikes]'))
    SET IDENTITY_INSERT [GalleryLikes] ON;
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (11, '2026-05-02T18:46:30.1333096+03:00', 1, N'fan12@halk.com'),
(12, '2026-05-02T18:46:30.1333099+03:00', 1, N'fan13@halk.com'),
(13, '2026-05-02T18:46:30.1333101+03:00', 1, N'fan14@halk.com'),
(14, '2026-05-02T18:46:30.1333103+03:00', 1, N'fan15@halk.com'),
(15, '2026-05-02T18:46:30.1333105+03:00', 1, N'fan16@halk.com'),
(16, '2026-05-02T18:46:30.1333108+03:00', 1, N'fan17@halk.com'),
(17, '2026-05-02T18:46:30.1333110+03:00', 1, N'fan18@halk.com'),
(18, '2026-05-02T18:46:30.1333114+03:00', 1, N'fan19@halk.com'),
(19, '2026-05-02T18:46:30.1333116+03:00', 1, N'fan20@halk.com'),
(20, '2026-05-02T18:46:30.1333119+03:00', 1, N'fan21@halk.com'),
(21, '2026-05-02T18:46:30.1333121+03:00', 1, N'fan22@halk.com'),
(22, '2026-05-02T18:46:30.1333123+03:00', 1, N'fan23@halk.com'),
(23, '2026-05-02T18:46:30.1333125+03:00', 1, N'fan24@halk.com'),
(24, '2026-05-02T18:46:30.1333127+03:00', 1, N'fan25@halk.com'),
(25, '2026-05-02T18:46:30.1333144+03:00', 1, N'fan26@halk.com'),
(26, '2026-05-02T18:46:30.1333148+03:00', 1, N'fan27@halk.com'),
(27, '2026-05-02T18:46:30.1333150+03:00', 1, N'fan28@halk.com'),
(28, '2026-05-02T18:46:30.1333152+03:00', 1, N'fan29@halk.com'),
(29, '2026-05-02T18:46:30.1333155+03:00', 1, N'fan30@halk.com'),
(30, '2026-05-02T18:46:30.1333157+03:00', 1, N'fan31@halk.com'),
(31, '2026-05-02T18:46:30.1333159+03:00', 1, N'fan32@halk.com'),
(32, '2026-05-02T18:46:30.1333161+03:00', 1, N'fan33@halk.com'),
(33, '2026-05-02T18:46:30.1333163+03:00', 1, N'fan34@halk.com'),
(34, '2026-05-02T18:46:30.1333167+03:00', 1, N'fan35@halk.com'),
(35, '2026-05-02T18:46:30.1333169+03:00', 1, N'fan36@halk.com'),
(36, '2026-05-02T18:46:30.1333171+03:00', 1, N'fan37@halk.com'),
(37, '2026-05-02T18:46:30.1333173+03:00', 1, N'fan38@halk.com'),
(38, '2026-05-02T18:46:30.1333176+03:00', 1, N'fan39@halk.com'),
(39, '2026-05-02T18:46:30.1333178+03:00', 1, N'fan40@halk.com'),
(40, '2026-05-02T18:46:30.1333180+03:00', 1, N'fan41@halk.com'),
(41, '2026-05-02T18:46:30.1333182+03:00', 1, N'fan42@halk.com'),
(42, '2026-05-02T18:46:30.1333184+03:00', 1, N'fan43@halk.com'),
(43, '2026-05-02T18:46:30.1333186+03:00', 1, N'fan44@halk.com'),
(44, '2026-05-02T18:46:30.1333188+03:00', 1, N'fan45@halk.com'),
(45, '2026-05-02T18:46:30.1333190+03:00', 1, N'fan46@halk.com'),
(46, '2026-05-02T18:46:30.1333193+03:00', 1, N'fan47@halk.com'),
(47, '2026-05-02T18:46:30.1333195+03:00', 1, N'fan48@halk.com'),
(48, '2026-05-02T18:46:30.1333197+03:00', 1, N'fan49@halk.com'),
(49, '2026-05-02T18:46:30.1333199+03:00', 1, N'fan50@halk.com'),
(50, '2026-05-02T18:46:30.1333201+03:00', 1, N'fan51@halk.com'),
(51, '2026-05-02T18:46:30.1333203+03:00', 1, N'fan52@halk.com'),
(52, '2026-05-02T18:46:30.1333205+03:00', 1, N'fan53@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (53, '2026-05-02T18:46:30.1333207+03:00', 1, N'fan54@halk.com'),
(54, '2026-05-02T18:46:30.1333209+03:00', 1, N'fan55@halk.com'),
(55, '2026-05-02T18:46:30.1333211+03:00', 1, N'fan56@halk.com'),
(56, '2026-05-02T18:46:30.1333213+03:00', 1, N'fan57@halk.com'),
(57, '2026-05-02T18:46:30.1333215+03:00', 1, N'fan58@halk.com'),
(58, '2026-05-02T18:46:30.1333217+03:00', 1, N'fan59@halk.com'),
(59, '2026-05-02T18:46:30.1333220+03:00', 1, N'fan60@halk.com'),
(60, '2026-05-02T18:46:30.1333222+03:00', 1, N'fan61@halk.com'),
(61, '2026-05-02T18:46:30.1333224+03:00', 1, N'fan62@halk.com'),
(62, '2026-05-02T18:46:30.1333226+03:00', 1, N'fan63@halk.com'),
(63, '2026-05-02T18:46:30.1333229+03:00', 1, N'fan64@halk.com'),
(64, '2026-05-02T18:46:30.1333231+03:00', 1, N'fan65@halk.com'),
(65, '2026-05-02T18:46:30.1333233+03:00', 1, N'fan66@halk.com'),
(66, '2026-05-02T18:46:30.1333237+03:00', 1, N'fan67@halk.com'),
(67, '2026-05-02T18:46:30.1333239+03:00', 1, N'fan68@halk.com'),
(68, '2026-05-02T18:46:30.1333241+03:00', 1, N'fan69@halk.com'),
(69, '2026-05-02T18:46:30.1333243+03:00', 1, N'fan70@halk.com'),
(70, '2026-05-02T18:46:30.1333246+03:00', 1, N'fan71@halk.com'),
(71, '2026-05-02T18:46:30.1333248+03:00', 1, N'fan72@halk.com'),
(72, '2026-05-02T18:46:30.1333250+03:00', 1, N'fan73@halk.com'),
(73, '2026-05-02T18:46:30.1333252+03:00', 1, N'fan74@halk.com'),
(74, '2026-05-02T18:46:30.1333254+03:00', 1, N'fan75@halk.com'),
(75, '2026-05-02T18:46:30.1333256+03:00', 1, N'fan76@halk.com'),
(76, '2026-05-02T18:46:30.1333258+03:00', 1, N'fan77@halk.com'),
(77, '2026-05-02T18:46:30.1333260+03:00', 1, N'fan78@halk.com'),
(78, '2026-05-02T18:46:30.1333262+03:00', 1, N'fan79@halk.com'),
(79, '2026-05-02T18:46:30.1333264+03:00', 1, N'fan80@halk.com'),
(80, '2026-05-02T18:46:30.1333266+03:00', 1, N'fan81@halk.com'),
(81, '2026-05-02T18:46:30.1333268+03:00', 1, N'fan82@halk.com'),
(82, '2026-05-02T18:46:30.1333271+03:00', 1, N'fan83@halk.com'),
(83, '2026-05-02T18:46:30.1333273+03:00', 1, N'fan84@halk.com'),
(84, '2026-05-02T18:46:30.1333275+03:00', 1, N'fan85@halk.com'),
(85, '2026-05-02T18:46:30.1333277+03:00', 1, N'fan86@halk.com'),
(86, '2026-05-02T18:46:30.1333280+03:00', 1, N'fan87@halk.com'),
(87, '2026-05-02T18:46:30.1333282+03:00', 1, N'fan88@halk.com'),
(88, '2026-05-02T18:46:30.1333295+03:00', 1, N'fan89@halk.com'),
(89, '2026-05-02T18:46:30.1333300+03:00', 1, N'fan90@halk.com'),
(90, '2026-05-02T18:46:30.1333303+03:00', 1, N'fan91@halk.com'),
(91, '2026-05-02T18:46:30.1333305+03:00', 1, N'fan92@halk.com'),
(92, '2026-05-02T18:46:30.1333307+03:00', 1, N'fan93@halk.com'),
(93, '2026-05-02T18:46:30.1333309+03:00', 1, N'fan94@halk.com'),
(94, '2026-05-02T18:46:30.1333311+03:00', 1, N'fan95@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (95, '2026-05-02T18:46:30.1333313+03:00', 1, N'fan96@halk.com'),
(96, '2026-05-02T18:46:30.1333315+03:00', 1, N'fan97@halk.com'),
(97, '2026-05-02T18:46:30.1333317+03:00', 1, N'fan98@halk.com'),
(98, '2026-05-02T18:46:30.1333319+03:00', 1, N'fan99@halk.com'),
(99, '2026-05-02T18:46:30.1333321+03:00', 1, N'fan100@halk.com'),
(100, '2026-05-02T18:46:30.1333325+03:00', 1, N'fan101@halk.com'),
(101, '2026-05-02T18:46:30.1333327+03:00', 1, N'fan102@halk.com'),
(102, '2026-05-02T18:46:30.1333329+03:00', 1, N'fan103@halk.com'),
(103, '2026-05-02T18:46:30.1333331+03:00', 1, N'fan104@halk.com'),
(104, '2026-05-02T18:46:30.1333333+03:00', 1, N'fan105@halk.com'),
(105, '2026-05-02T18:46:30.1333335+03:00', 1, N'fan106@halk.com'),
(106, '2026-05-02T18:46:30.1333338+03:00', 1, N'fan107@halk.com'),
(107, '2026-05-02T18:46:30.1333340+03:00', 1, N'fan108@halk.com'),
(108, '2026-05-02T18:46:30.1333342+03:00', 1, N'fan109@halk.com'),
(109, '2026-05-02T18:46:30.1333344+03:00', 1, N'fan110@halk.com'),
(110, '2026-05-02T18:46:30.1333346+03:00', 1, N'fan111@halk.com'),
(111, '2026-05-02T18:46:30.1333348+03:00', 1, N'fan112@halk.com'),
(112, '2026-05-02T18:46:30.1333351+03:00', 1, N'fan113@halk.com'),
(113, '2026-05-02T18:46:30.1336120+03:00', 2, N'fan114@halk.com'),
(114, '2026-05-02T18:46:30.1336131+03:00', 2, N'fan115@halk.com'),
(115, '2026-05-02T18:46:30.1336135+03:00', 2, N'fan116@halk.com'),
(116, '2026-05-02T18:46:30.1336138+03:00', 2, N'fan117@halk.com'),
(117, '2026-05-02T18:46:30.1336141+03:00', 2, N'fan118@halk.com'),
(118, '2026-05-02T18:46:30.1336144+03:00', 2, N'fan119@halk.com'),
(119, '2026-05-02T18:46:30.1336147+03:00', 2, N'fan120@halk.com'),
(120, '2026-05-02T18:46:30.1336149+03:00', 2, N'fan121@halk.com'),
(121, '2026-05-02T18:46:30.1336152+03:00', 2, N'fan122@halk.com'),
(122, '2026-05-02T18:46:30.1336154+03:00', 2, N'fan123@halk.com'),
(123, '2026-05-02T18:46:30.1336156+03:00', 2, N'fan124@halk.com'),
(124, '2026-05-02T18:46:30.1336158+03:00', 2, N'fan125@halk.com'),
(125, '2026-05-02T18:46:30.1336160+03:00', 2, N'fan126@halk.com'),
(126, '2026-05-02T18:46:30.1336162+03:00', 2, N'fan127@halk.com'),
(127, '2026-05-02T18:46:30.1336164+03:00', 2, N'fan128@halk.com'),
(128, '2026-05-02T18:46:30.1336166+03:00', 2, N'fan129@halk.com'),
(129, '2026-05-02T18:46:30.1336169+03:00', 2, N'fan130@halk.com'),
(130, '2026-05-02T18:46:30.1336175+03:00', 2, N'fan131@halk.com'),
(131, '2026-05-02T18:46:30.1336177+03:00', 2, N'fan132@halk.com'),
(132, '2026-05-02T18:46:30.1336180+03:00', 2, N'fan133@halk.com'),
(133, '2026-05-02T18:46:30.1336182+03:00', 2, N'fan134@halk.com'),
(134, '2026-05-02T18:46:30.1336184+03:00', 2, N'fan135@halk.com'),
(135, '2026-05-02T18:46:30.1336186+03:00', 2, N'fan136@halk.com'),
(136, '2026-05-02T18:46:30.1336189+03:00', 2, N'fan137@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (137, '2026-05-02T18:46:30.1336191+03:00', 2, N'fan138@halk.com'),
(138, '2026-05-02T18:46:30.1336193+03:00', 2, N'fan139@halk.com'),
(139, '2026-05-02T18:46:30.1336195+03:00', 2, N'fan140@halk.com'),
(140, '2026-05-02T18:46:30.1336197+03:00', 2, N'fan141@halk.com'),
(141, '2026-05-02T18:46:30.1336199+03:00', 2, N'fan142@halk.com'),
(142, '2026-05-02T18:46:30.1336201+03:00', 2, N'fan143@halk.com'),
(143, '2026-05-02T18:46:30.1336203+03:00', 2, N'fan144@halk.com'),
(144, '2026-05-02T18:46:30.1336205+03:00', 2, N'fan145@halk.com'),
(145, '2026-05-02T18:46:30.1336218+03:00', 2, N'fan146@halk.com'),
(146, '2026-05-02T18:46:30.1336220+03:00', 2, N'fan147@halk.com'),
(147, '2026-05-02T18:46:30.1336223+03:00', 2, N'fan148@halk.com'),
(148, '2026-05-02T18:46:30.1336225+03:00', 2, N'fan149@halk.com'),
(149, '2026-05-02T18:46:30.1336227+03:00', 2, N'fan150@halk.com'),
(150, '2026-05-02T18:46:30.1336229+03:00', 2, N'fan151@halk.com'),
(151, '2026-05-02T18:46:30.1336231+03:00', 2, N'fan152@halk.com'),
(152, '2026-05-02T18:46:30.1336233+03:00', 2, N'fan153@halk.com'),
(153, '2026-05-02T18:46:30.1336236+03:00', 2, N'fan154@halk.com'),
(154, '2026-05-02T18:46:30.1336238+03:00', 2, N'fan155@halk.com'),
(155, '2026-05-02T18:46:30.1336240+03:00', 2, N'fan156@halk.com'),
(156, '2026-05-02T18:46:30.1336242+03:00', 2, N'fan157@halk.com'),
(157, '2026-05-02T18:46:30.1336244+03:00', 2, N'fan158@halk.com'),
(158, '2026-05-02T18:46:30.1336246+03:00', 2, N'fan159@halk.com'),
(159, '2026-05-02T18:46:30.1336248+03:00', 2, N'fan160@halk.com'),
(160, '2026-05-02T18:46:30.1336250+03:00', 2, N'fan161@halk.com'),
(161, '2026-05-02T18:46:30.1336253+03:00', 2, N'fan162@halk.com'),
(162, '2026-05-02T18:46:30.1336255+03:00', 2, N'fan163@halk.com'),
(163, '2026-05-02T18:46:30.1336257+03:00', 2, N'fan164@halk.com'),
(164, '2026-05-02T18:46:30.1336259+03:00', 2, N'fan165@halk.com'),
(165, '2026-05-02T18:46:30.1336261+03:00', 2, N'fan166@halk.com'),
(166, '2026-05-02T18:46:30.1336263+03:00', 2, N'fan167@halk.com'),
(167, '2026-05-02T18:46:30.1336265+03:00', 2, N'fan168@halk.com'),
(168, '2026-05-02T18:46:30.1336267+03:00', 2, N'fan169@halk.com'),
(169, '2026-05-02T18:46:30.1336269+03:00', 2, N'fan170@halk.com'),
(170, '2026-05-02T18:46:30.1336272+03:00', 2, N'fan171@halk.com'),
(171, '2026-05-02T18:46:30.1336274+03:00', 2, N'fan172@halk.com'),
(172, '2026-05-02T18:46:30.1336276+03:00', 2, N'fan173@halk.com'),
(173, '2026-05-02T18:46:30.1336278+03:00', 2, N'fan174@halk.com'),
(174, '2026-05-02T18:46:30.1336280+03:00', 2, N'fan175@halk.com'),
(175, '2026-05-02T18:46:30.1336282+03:00', 2, N'fan176@halk.com'),
(176, '2026-05-02T18:46:30.1336284+03:00', 2, N'fan177@halk.com'),
(177, '2026-05-02T18:46:30.1336286+03:00', 2, N'fan178@halk.com'),
(178, '2026-05-02T18:46:30.1336288+03:00', 2, N'fan179@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (179, '2026-05-02T18:46:30.1336290+03:00', 2, N'fan180@halk.com'),
(180, '2026-05-02T18:46:30.1336292+03:00', 2, N'fan181@halk.com'),
(181, '2026-05-02T18:46:30.1336294+03:00', 2, N'fan182@halk.com'),
(182, '2026-05-02T18:46:30.1336297+03:00', 2, N'fan183@halk.com'),
(183, '2026-05-02T18:46:30.1336299+03:00', 2, N'fan184@halk.com'),
(184, '2026-05-02T18:46:30.1336301+03:00', 2, N'fan185@halk.com'),
(185, '2026-05-02T18:46:30.1336303+03:00', 2, N'fan186@halk.com'),
(186, '2026-05-02T18:46:30.1336305+03:00', 2, N'fan187@halk.com'),
(187, '2026-05-02T18:46:30.1336308+03:00', 2, N'fan188@halk.com'),
(188, '2026-05-02T18:46:30.1336310+03:00', 2, N'fan189@halk.com'),
(189, '2026-05-02T18:46:30.1336312+03:00', 2, N'fan190@halk.com'),
(190, '2026-05-02T18:46:30.1336314+03:00', 2, N'fan191@halk.com'),
(191, '2026-05-02T18:46:30.1336316+03:00', 2, N'fan192@halk.com'),
(192, '2026-05-02T18:46:30.1336318+03:00', 2, N'fan193@halk.com'),
(193, '2026-05-02T18:46:30.1336320+03:00', 2, N'fan194@halk.com'),
(194, '2026-05-02T18:46:30.1336322+03:00', 2, N'fan195@halk.com'),
(195, '2026-05-02T18:46:30.1336324+03:00', 2, N'fan196@halk.com'),
(196, '2026-05-02T18:46:30.1336326+03:00', 2, N'fan197@halk.com'),
(197, '2026-05-02T18:46:30.1336328+03:00', 2, N'fan198@halk.com'),
(198, '2026-05-02T18:46:30.1336330+03:00', 2, N'fan199@halk.com'),
(199, '2026-05-02T18:46:30.1336332+03:00', 2, N'fan200@halk.com'),
(200, '2026-05-02T18:46:30.1336334+03:00', 2, N'fan201@halk.com'),
(201, '2026-05-02T18:46:30.1336336+03:00', 2, N'fan202@halk.com'),
(202, '2026-05-02T18:46:30.1336338+03:00', 2, N'fan203@halk.com'),
(203, '2026-05-02T18:46:30.1336341+03:00', 2, N'fan204@halk.com'),
(204, '2026-05-02T18:46:30.1336344+03:00', 2, N'fan205@halk.com'),
(205, '2026-05-02T18:46:30.1336346+03:00', 2, N'fan206@halk.com'),
(206, '2026-05-02T18:46:30.1336348+03:00', 2, N'fan207@halk.com'),
(207, '2026-05-02T18:46:30.1336350+03:00', 2, N'fan208@halk.com'),
(208, '2026-05-02T18:46:30.1336352+03:00', 2, N'fan209@halk.com'),
(209, '2026-05-02T18:46:30.1336354+03:00', 2, N'fan210@halk.com'),
(210, '2026-05-02T18:46:30.1336356+03:00', 2, N'fan211@halk.com'),
(211, '2026-05-02T18:46:30.1336358+03:00', 2, N'fan212@halk.com'),
(212, '2026-05-02T18:46:30.1336360+03:00', 2, N'fan213@halk.com'),
(213, '2026-05-02T18:46:30.1336362+03:00', 2, N'fan214@halk.com'),
(214, '2026-05-02T18:46:30.1336364+03:00', 2, N'fan215@halk.com'),
(215, '2026-05-02T18:46:30.1336366+03:00', 2, N'fan216@halk.com'),
(216, '2026-05-02T18:46:30.1336368+03:00', 2, N'fan217@halk.com'),
(217, '2026-05-02T18:46:30.1336370+03:00', 2, N'fan218@halk.com'),
(218, '2026-05-02T18:46:30.1336372+03:00', 2, N'fan219@halk.com'),
(219, '2026-05-02T18:46:30.1336374+03:00', 2, N'fan220@halk.com'),
(220, '2026-05-02T18:46:30.1336377+03:00', 2, N'fan221@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (221, '2026-05-02T18:46:30.1336379+03:00', 2, N'fan222@halk.com'),
(222, '2026-05-02T18:46:30.1336381+03:00', 2, N'fan223@halk.com'),
(223, '2026-05-02T18:46:30.1336391+03:00', 2, N'fan224@halk.com'),
(224, '2026-05-02T18:46:30.1336397+03:00', 2, N'fan225@halk.com'),
(225, '2026-05-02T18:46:30.1336411+03:00', 3, N'fan226@halk.com'),
(226, '2026-05-02T18:46:30.1336413+03:00', 3, N'fan227@halk.com'),
(227, '2026-05-02T18:46:30.1336415+03:00', 3, N'fan228@halk.com'),
(228, '2026-05-02T18:46:30.1336417+03:00', 3, N'fan229@halk.com'),
(229, '2026-05-02T18:46:30.1336419+03:00', 3, N'fan230@halk.com'),
(230, '2026-05-02T18:46:30.1336421+03:00', 3, N'fan231@halk.com'),
(231, '2026-05-02T18:46:30.1336423+03:00', 3, N'fan232@halk.com'),
(232, '2026-05-02T18:46:30.1336425+03:00', 3, N'fan233@halk.com'),
(233, '2026-05-02T18:46:30.1336427+03:00', 3, N'fan234@halk.com'),
(234, '2026-05-02T18:46:30.1336429+03:00', 3, N'fan235@halk.com'),
(235, '2026-05-02T18:46:30.1336431+03:00', 3, N'fan236@halk.com'),
(236, '2026-05-02T18:46:30.1336433+03:00', 3, N'fan237@halk.com'),
(237, '2026-05-02T18:46:30.1336435+03:00', 3, N'fan238@halk.com'),
(238, '2026-05-02T18:46:30.1336437+03:00', 3, N'fan239@halk.com'),
(239, '2026-05-02T18:46:30.1336439+03:00', 3, N'fan240@halk.com'),
(240, '2026-05-02T18:46:30.1336441+03:00', 3, N'fan241@halk.com'),
(241, '2026-05-02T18:46:30.1336444+03:00', 3, N'fan242@halk.com'),
(242, '2026-05-02T18:46:30.1336446+03:00', 3, N'fan243@halk.com'),
(243, '2026-05-02T18:46:30.1336448+03:00', 3, N'fan244@halk.com'),
(244, '2026-05-02T18:46:30.1336451+03:00', 3, N'fan245@halk.com'),
(245, '2026-05-02T18:46:30.1336453+03:00', 3, N'fan246@halk.com'),
(246, '2026-05-02T18:46:30.1336455+03:00', 3, N'fan247@halk.com'),
(247, '2026-05-02T18:46:30.1336457+03:00', 3, N'fan248@halk.com'),
(248, '2026-05-02T18:46:30.1336459+03:00', 3, N'fan249@halk.com'),
(249, '2026-05-02T18:46:30.1336461+03:00', 3, N'fan250@halk.com'),
(250, '2026-05-02T18:46:30.1336463+03:00', 3, N'fan251@halk.com'),
(251, '2026-05-02T18:46:30.1336465+03:00', 3, N'fan252@halk.com'),
(252, '2026-05-02T18:46:30.1336467+03:00', 3, N'fan253@halk.com'),
(253, '2026-05-02T18:46:30.1336469+03:00', 3, N'fan254@halk.com'),
(254, '2026-05-02T18:46:30.1336471+03:00', 3, N'fan255@halk.com'),
(255, '2026-05-02T18:46:30.1336474+03:00', 3, N'fan256@halk.com'),
(256, '2026-05-02T18:46:30.1336476+03:00', 3, N'fan257@halk.com'),
(257, '2026-05-02T18:46:30.1336478+03:00', 3, N'fan258@halk.com'),
(258, '2026-05-02T18:46:30.1336483+03:00', 3, N'fan259@halk.com'),
(259, '2026-05-02T18:46:30.1336485+03:00', 3, N'fan260@halk.com'),
(260, '2026-05-02T18:46:30.1336487+03:00', 3, N'fan261@halk.com'),
(261, '2026-05-02T18:46:30.1336497+03:00', 3, N'fan262@halk.com'),
(262, '2026-05-02T18:46:30.1336500+03:00', 3, N'fan263@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (263, '2026-05-02T18:46:30.1336502+03:00', 3, N'fan264@halk.com'),
(264, '2026-05-02T18:46:30.1336504+03:00', 3, N'fan265@halk.com'),
(265, '2026-05-02T18:46:30.1336506+03:00', 3, N'fan266@halk.com'),
(266, '2026-05-02T18:46:30.1336508+03:00', 3, N'fan267@halk.com'),
(267, '2026-05-02T18:46:30.1336510+03:00', 3, N'fan268@halk.com'),
(268, '2026-05-02T18:46:30.1336512+03:00', 3, N'fan269@halk.com'),
(269, '2026-05-02T18:46:30.1336514+03:00', 3, N'fan270@halk.com'),
(270, '2026-05-02T18:46:30.1336516+03:00', 3, N'fan271@halk.com'),
(271, '2026-05-02T18:46:30.1336518+03:00', 3, N'fan272@halk.com'),
(272, '2026-05-02T18:46:30.1336521+03:00', 3, N'fan273@halk.com'),
(273, '2026-05-02T18:46:30.1336523+03:00', 3, N'fan274@halk.com'),
(274, '2026-05-02T18:46:30.1336525+03:00', 3, N'fan275@halk.com'),
(275, '2026-05-02T18:46:30.1336527+03:00', 3, N'fan276@halk.com'),
(276, '2026-05-02T18:46:30.1336529+03:00', 3, N'fan277@halk.com'),
(277, '2026-05-02T18:46:30.1336531+03:00', 3, N'fan278@halk.com'),
(278, '2026-05-02T18:46:30.1336533+03:00', 3, N'fan279@halk.com'),
(279, '2026-05-02T18:46:30.1336535+03:00', 3, N'fan280@halk.com'),
(280, '2026-05-02T18:46:30.1336537+03:00', 3, N'fan281@halk.com'),
(281, '2026-05-02T18:46:30.1336539+03:00', 3, N'fan282@halk.com'),
(282, '2026-05-02T18:46:30.1336541+03:00', 3, N'fan283@halk.com'),
(283, '2026-05-02T18:46:30.1336543+03:00', 3, N'fan284@halk.com'),
(284, '2026-05-02T18:46:30.1336545+03:00', 3, N'fan285@halk.com'),
(285, '2026-05-02T18:46:30.1336547+03:00', 3, N'fan286@halk.com'),
(286, '2026-05-02T18:46:30.1336549+03:00', 3, N'fan287@halk.com'),
(287, '2026-05-02T18:46:30.1336551+03:00', 3, N'fan288@halk.com'),
(288, '2026-05-02T18:46:30.1336554+03:00', 3, N'fan289@halk.com'),
(289, '2026-05-02T18:46:30.1336556+03:00', 3, N'fan290@halk.com'),
(290, '2026-05-02T18:46:30.1336558+03:00', 3, N'fan291@halk.com'),
(291, '2026-05-02T18:46:30.1336560+03:00', 3, N'fan292@halk.com'),
(292, '2026-05-02T18:46:30.1336563+03:00', 3, N'fan293@halk.com'),
(293, '2026-05-02T18:46:30.1336565+03:00', 3, N'fan294@halk.com'),
(294, '2026-05-02T18:46:30.1336567+03:00', 3, N'fan295@halk.com'),
(295, '2026-05-02T18:46:30.1336569+03:00', 3, N'fan296@halk.com'),
(296, '2026-05-02T18:46:30.1336571+03:00', 3, N'fan297@halk.com'),
(297, '2026-05-02T18:46:30.1336573+03:00', 3, N'fan298@halk.com'),
(298, '2026-05-02T18:46:30.1336575+03:00', 3, N'fan299@halk.com'),
(299, '2026-05-02T18:46:30.1336577+03:00', 3, N'fan300@halk.com'),
(300, '2026-05-02T18:46:30.1336579+03:00', 3, N'fan301@halk.com'),
(301, '2026-05-02T18:46:30.1336581+03:00', 3, N'fan302@halk.com'),
(302, '2026-05-02T18:46:30.1336583+03:00', 3, N'fan303@halk.com'),
(303, '2026-05-02T18:46:30.1336585+03:00', 3, N'fan304@halk.com'),
(304, '2026-05-02T18:46:30.1336587+03:00', 3, N'fan305@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (305, '2026-05-02T18:46:30.1336590+03:00', 3, N'fan306@halk.com'),
(306, '2026-05-02T18:46:30.1336592+03:00', 3, N'fan307@halk.com'),
(307, '2026-05-02T18:46:30.1336594+03:00', 3, N'fan308@halk.com'),
(308, '2026-05-02T18:46:30.1336596+03:00', 3, N'fan309@halk.com'),
(309, '2026-05-02T18:46:30.1336598+03:00', 3, N'fan310@halk.com'),
(310, '2026-05-02T18:46:30.1336600+03:00', 3, N'fan311@halk.com'),
(311, '2026-05-02T18:46:30.1336602+03:00', 3, N'fan312@halk.com'),
(312, '2026-05-02T18:46:30.1336604+03:00', 3, N'fan313@halk.com'),
(313, '2026-05-02T18:46:30.1336606+03:00', 3, N'fan314@halk.com'),
(314, '2026-05-02T18:46:30.1336608+03:00', 3, N'fan315@halk.com'),
(315, '2026-05-02T18:46:30.1336610+03:00', 3, N'fan316@halk.com'),
(316, '2026-05-02T18:46:30.1336612+03:00', 3, N'fan317@halk.com'),
(317, '2026-05-02T18:46:30.1336614+03:00', 3, N'fan318@halk.com'),
(318, '2026-05-02T18:46:30.1336616+03:00', 3, N'fan319@halk.com'),
(319, '2026-05-02T18:46:30.1336618+03:00', 3, N'fan320@halk.com'),
(320, '2026-05-02T18:46:30.1336620+03:00', 3, N'fan321@halk.com'),
(321, '2026-05-02T18:46:30.1336622+03:00', 3, N'fan322@halk.com'),
(322, '2026-05-02T18:46:30.1336625+03:00', 3, N'fan323@halk.com'),
(323, '2026-05-02T18:46:30.1336627+03:00', 3, N'fan324@halk.com'),
(324, '2026-05-02T18:46:30.1336629+03:00', 3, N'fan325@halk.com'),
(325, '2026-05-02T18:46:30.1336631+03:00', 3, N'fan326@halk.com'),
(326, '2026-05-02T18:46:30.1336633+03:00', 3, N'fan327@halk.com'),
(327, '2026-05-02T18:46:30.1336635+03:00', 3, N'fan328@halk.com'),
(328, '2026-05-02T18:46:30.1336637+03:00', 3, N'fan329@halk.com'),
(329, '2026-05-02T18:46:30.1336639+03:00', 3, N'fan330@halk.com'),
(330, '2026-05-02T18:46:30.1336641+03:00', 3, N'fan331@halk.com'),
(331, '2026-05-02T18:46:30.1336643+03:00', 3, N'fan332@halk.com'),
(332, '2026-05-02T18:46:30.1336645+03:00', 3, N'fan333@halk.com'),
(333, '2026-05-02T18:46:30.1336647+03:00', 3, N'fan334@halk.com'),
(334, '2026-05-02T18:46:30.1336649+03:00', 3, N'fan335@halk.com'),
(335, '2026-05-02T18:46:30.1336651+03:00', 3, N'fan336@halk.com'),
(336, '2026-05-02T18:46:30.1336653+03:00', 3, N'fan337@halk.com'),
(337, '2026-05-02T18:46:30.1336655+03:00', 3, N'fan338@halk.com'),
(338, '2026-05-02T18:46:30.1336657+03:00', 3, N'fan339@halk.com'),
(339, '2026-05-02T18:46:30.1336668+03:00', 3, N'fan340@halk.com'),
(340, '2026-05-02T18:46:30.1336675+03:00', 3, N'fan341@halk.com'),
(341, '2026-05-02T18:46:30.1336677+03:00', 3, N'fan342@halk.com'),
(342, '2026-05-02T18:46:30.1336679+03:00', 3, N'fan343@halk.com'),
(343, '2026-05-02T18:46:30.1336681+03:00', 3, N'fan344@halk.com'),
(344, '2026-05-02T18:46:30.1336683+03:00', 3, N'fan345@halk.com'),
(345, '2026-05-02T18:46:30.1336685+03:00', 3, N'fan346@halk.com'),
(346, '2026-05-02T18:46:30.1336687+03:00', 3, N'fan347@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (347, '2026-05-02T18:46:30.1336689+03:00', 3, N'fan348@halk.com'),
(348, '2026-05-02T18:46:30.1336691+03:00', 3, N'fan349@halk.com'),
(349, '2026-05-02T18:46:30.1336693+03:00', 3, N'fan350@halk.com'),
(350, '2026-05-02T18:46:30.1336695+03:00', 3, N'fan351@halk.com'),
(351, '2026-05-02T18:46:30.1336697+03:00', 3, N'fan352@halk.com'),
(352, '2026-05-02T18:46:30.1336699+03:00', 3, N'fan353@halk.com'),
(353, '2026-05-02T18:46:30.1336701+03:00', 3, N'fan354@halk.com'),
(354, '2026-05-02T18:46:30.1336703+03:00', 3, N'fan355@halk.com'),
(355, '2026-05-02T18:46:30.1336706+03:00', 3, N'fan356@halk.com'),
(356, '2026-05-02T18:46:30.1336709+03:00', 3, N'fan357@halk.com'),
(357, '2026-05-02T18:46:30.1336711+03:00', 3, N'fan358@halk.com'),
(358, '2026-05-02T18:46:30.1336713+03:00', 3, N'fan359@halk.com'),
(359, '2026-05-02T18:46:30.1336715+03:00', 3, N'fan360@halk.com'),
(360, '2026-05-02T18:46:30.1336717+03:00', 3, N'fan361@halk.com'),
(361, '2026-05-02T18:46:30.1336719+03:00', 3, N'fan362@halk.com'),
(362, '2026-05-02T18:46:30.1336721+03:00', 3, N'fan363@halk.com'),
(363, '2026-05-02T18:46:30.1336723+03:00', 3, N'fan364@halk.com'),
(364, '2026-05-02T18:46:30.1336725+03:00', 3, N'fan365@halk.com'),
(365, '2026-05-02T18:46:30.1336727+03:00', 3, N'fan366@halk.com'),
(366, '2026-05-02T18:46:30.1336729+03:00', 3, N'fan367@halk.com'),
(367, '2026-05-02T18:46:30.1336731+03:00', 3, N'fan368@halk.com'),
(368, '2026-05-02T18:46:30.1336733+03:00', 3, N'fan369@halk.com'),
(369, '2026-05-02T18:46:30.1336735+03:00', 3, N'fan370@halk.com'),
(370, '2026-05-02T18:46:30.1336737+03:00', 3, N'fan371@halk.com'),
(371, '2026-05-02T18:46:30.1336739+03:00', 3, N'fan372@halk.com'),
(372, '2026-05-02T18:46:30.1336741+03:00', 3, N'fan373@halk.com'),
(373, '2026-05-02T18:46:30.1336743+03:00', 3, N'fan374@halk.com'),
(374, '2026-05-02T18:46:30.1336746+03:00', 3, N'fan375@halk.com'),
(375, '2026-05-02T18:46:30.1336748+03:00', 3, N'fan376@halk.com'),
(376, '2026-05-02T18:46:30.1336750+03:00', 3, N'fan377@halk.com'),
(377, '2026-05-02T18:46:30.1336752+03:00', 3, N'fan378@halk.com'),
(378, '2026-05-02T18:46:30.1336754+03:00', 3, N'fan379@halk.com'),
(379, '2026-05-02T18:46:30.1336756+03:00', 3, N'fan380@halk.com'),
(380, '2026-05-02T18:46:30.1336758+03:00', 3, N'fan381@halk.com'),
(381, '2026-05-02T18:46:30.1336760+03:00', 3, N'fan382@halk.com'),
(382, '2026-05-02T18:46:30.1336762+03:00', 3, N'fan383@halk.com'),
(383, '2026-05-02T18:46:30.1336764+03:00', 3, N'fan384@halk.com'),
(384, '2026-05-02T18:46:30.1336766+03:00', 3, N'fan385@halk.com'),
(385, '2026-05-02T18:46:30.1336768+03:00', 3, N'fan386@halk.com'),
(386, '2026-05-02T18:46:30.1336770+03:00', 3, N'fan387@halk.com'),
(387, '2026-05-02T18:46:30.1336772+03:00', 3, N'fan388@halk.com'),
(388, '2026-05-02T18:46:30.1336774+03:00', 3, N'fan389@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (389, '2026-05-02T18:46:30.1336776+03:00', 3, N'fan390@halk.com'),
(390, '2026-05-02T18:46:30.1336778+03:00', 3, N'fan391@halk.com'),
(391, '2026-05-02T18:46:30.1336781+03:00', 3, N'fan392@halk.com'),
(392, '2026-05-02T18:46:30.1336783+03:00', 3, N'fan393@halk.com'),
(393, '2026-05-02T18:46:30.1336785+03:00', 3, N'fan394@halk.com'),
(394, '2026-05-02T18:46:30.1336787+03:00', 3, N'fan395@halk.com'),
(395, '2026-05-02T18:46:30.1336789+03:00', 3, N'fan396@halk.com'),
(396, '2026-05-02T18:46:30.1336791+03:00', 3, N'fan397@halk.com'),
(397, '2026-05-02T18:46:30.1336793+03:00', 3, N'fan398@halk.com'),
(398, '2026-05-02T18:46:30.1336795+03:00', 3, N'fan399@halk.com'),
(399, '2026-05-02T18:46:30.1336797+03:00', 3, N'fan400@halk.com'),
(400, '2026-05-02T18:46:30.1336799+03:00', 3, N'fan401@halk.com'),
(401, '2026-05-02T18:46:30.1336801+03:00', 3, N'fan402@halk.com'),
(402, '2026-05-02T18:46:30.1336803+03:00', 3, N'fan403@halk.com'),
(403, '2026-05-02T18:46:30.1336805+03:00', 3, N'fan404@halk.com'),
(404, '2026-05-02T18:46:30.1336807+03:00', 3, N'fan405@halk.com'),
(405, '2026-05-02T18:46:30.1336809+03:00', 3, N'fan406@halk.com'),
(406, '2026-05-02T18:46:30.1336811+03:00', 3, N'fan407@halk.com'),
(407, '2026-05-02T18:46:30.1336813+03:00', 3, N'fan408@halk.com'),
(408, '2026-05-02T18:46:30.1336816+03:00', 3, N'fan409@halk.com'),
(409, '2026-05-02T18:46:30.1336818+03:00', 3, N'fan410@halk.com'),
(410, '2026-05-02T18:46:30.1336820+03:00', 3, N'fan411@halk.com'),
(411, '2026-05-02T18:46:30.1336822+03:00', 3, N'fan412@halk.com'),
(412, '2026-05-02T18:46:30.1336824+03:00', 3, N'fan413@halk.com'),
(413, '2026-05-02T18:46:30.1336826+03:00', 3, N'fan414@halk.com'),
(414, '2026-05-02T18:46:30.1336828+03:00', 3, N'fan415@halk.com'),
(415, '2026-05-02T18:46:30.1336830+03:00', 3, N'fan416@halk.com'),
(416, '2026-05-02T18:46:30.1336832+03:00', 3, N'fan417@halk.com'),
(417, '2026-05-02T18:46:30.1336834+03:00', 3, N'fan418@halk.com'),
(418, '2026-05-02T18:46:30.1336842+03:00', 3, N'fan419@halk.com'),
(419, '2026-05-02T18:46:30.1336848+03:00', 3, N'fan420@halk.com'),
(420, '2026-05-02T18:46:30.1336850+03:00', 3, N'fan421@halk.com'),
(421, '2026-05-02T18:46:30.1336852+03:00', 3, N'fan422@halk.com'),
(422, '2026-05-02T18:46:30.1336854+03:00', 3, N'fan423@halk.com'),
(423, '2026-05-02T18:46:30.1336865+03:00', 4, N'fan424@halk.com'),
(424, '2026-05-02T18:46:30.1336868+03:00', 4, N'fan425@halk.com'),
(425, '2026-05-02T18:46:30.1336870+03:00', 4, N'fan426@halk.com'),
(426, '2026-05-02T18:46:30.1336872+03:00', 4, N'fan427@halk.com'),
(427, '2026-05-02T18:46:30.1336874+03:00', 4, N'fan428@halk.com'),
(428, '2026-05-02T18:46:30.1336876+03:00', 4, N'fan429@halk.com'),
(429, '2026-05-02T18:46:30.1336878+03:00', 4, N'fan430@halk.com'),
(430, '2026-05-02T18:46:30.1336880+03:00', 4, N'fan431@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (431, '2026-05-02T18:46:30.1336882+03:00', 4, N'fan432@halk.com'),
(432, '2026-05-02T18:46:30.1336884+03:00', 4, N'fan433@halk.com'),
(433, '2026-05-02T18:46:30.1336886+03:00', 4, N'fan434@halk.com'),
(434, '2026-05-02T18:46:30.1336888+03:00', 4, N'fan435@halk.com'),
(435, '2026-05-02T18:46:30.1336890+03:00', 4, N'fan436@halk.com'),
(436, '2026-05-02T18:46:30.1336892+03:00', 4, N'fan437@halk.com'),
(437, '2026-05-02T18:46:30.1336894+03:00', 4, N'fan438@halk.com'),
(438, '2026-05-02T18:46:30.1336896+03:00', 4, N'fan439@halk.com'),
(439, '2026-05-02T18:46:30.1336898+03:00', 4, N'fan440@halk.com'),
(440, '2026-05-02T18:46:30.1336901+03:00', 4, N'fan441@halk.com'),
(441, '2026-05-02T18:46:30.1336903+03:00', 4, N'fan442@halk.com'),
(442, '2026-05-02T18:46:30.1336905+03:00', 4, N'fan443@halk.com'),
(443, '2026-05-02T18:46:30.1336907+03:00', 4, N'fan444@halk.com'),
(444, '2026-05-02T18:46:30.1336909+03:00', 4, N'fan445@halk.com'),
(445, '2026-05-02T18:46:30.1336911+03:00', 4, N'fan446@halk.com'),
(446, '2026-05-02T18:46:30.1336913+03:00', 4, N'fan447@halk.com'),
(447, '2026-05-02T18:46:30.1336915+03:00', 4, N'fan448@halk.com'),
(448, '2026-05-02T18:46:30.1336917+03:00', 4, N'fan449@halk.com'),
(449, '2026-05-02T18:46:30.1336919+03:00', 4, N'fan450@halk.com'),
(450, '2026-05-02T18:46:30.1336921+03:00', 4, N'fan451@halk.com'),
(451, '2026-05-02T18:46:30.1336923+03:00', 4, N'fan452@halk.com'),
(452, '2026-05-02T18:46:30.1336925+03:00', 4, N'fan453@halk.com'),
(453, '2026-05-02T18:46:30.1336927+03:00', 4, N'fan454@halk.com'),
(454, '2026-05-02T18:46:30.1336929+03:00', 4, N'fan455@halk.com'),
(455, '2026-05-02T18:46:30.1336931+03:00', 4, N'fan456@halk.com'),
(456, '2026-05-02T18:46:30.1336933+03:00', 4, N'fan457@halk.com'),
(457, '2026-05-02T18:46:30.1336936+03:00', 4, N'fan458@halk.com'),
(458, '2026-05-02T18:46:30.1336938+03:00', 4, N'fan459@halk.com'),
(459, '2026-05-02T18:46:30.1336940+03:00', 4, N'fan460@halk.com'),
(460, '2026-05-02T18:46:30.1336942+03:00', 4, N'fan461@halk.com'),
(461, '2026-05-02T18:46:30.1336944+03:00', 4, N'fan462@halk.com'),
(462, '2026-05-02T18:46:30.1336946+03:00', 4, N'fan463@halk.com'),
(463, '2026-05-02T18:46:30.1336948+03:00', 4, N'fan464@halk.com'),
(464, '2026-05-02T18:46:30.1336950+03:00', 4, N'fan465@halk.com'),
(465, '2026-05-02T18:46:30.1336952+03:00', 4, N'fan466@halk.com'),
(466, '2026-05-02T18:46:30.1336954+03:00', 4, N'fan467@halk.com'),
(467, '2026-05-02T18:46:30.1336956+03:00', 4, N'fan468@halk.com'),
(468, '2026-05-02T18:46:30.1336958+03:00', 4, N'fan469@halk.com'),
(469, '2026-05-02T18:46:30.1336960+03:00', 4, N'fan470@halk.com'),
(470, '2026-05-02T18:46:30.1336962+03:00', 4, N'fan471@halk.com'),
(471, '2026-05-02T18:46:30.1336964+03:00', 4, N'fan472@halk.com'),
(472, '2026-05-02T18:46:30.1336966+03:00', 4, N'fan473@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (473, '2026-05-02T18:46:30.1336968+03:00', 4, N'fan474@halk.com'),
(474, '2026-05-02T18:46:30.1336971+03:00', 4, N'fan475@halk.com'),
(475, '2026-05-02T18:46:30.1336973+03:00', 4, N'fan476@halk.com'),
(476, '2026-05-02T18:46:30.1336975+03:00', 4, N'fan477@halk.com'),
(477, '2026-05-02T18:46:30.1336977+03:00', 4, N'fan478@halk.com'),
(478, '2026-05-02T18:46:30.1336979+03:00', 4, N'fan479@halk.com'),
(479, '2026-05-02T18:46:30.1336981+03:00', 4, N'fan480@halk.com'),
(480, '2026-05-02T18:46:30.1336983+03:00', 4, N'fan481@halk.com'),
(481, '2026-05-02T18:46:30.1336985+03:00', 4, N'fan482@halk.com'),
(482, '2026-05-02T18:46:30.1336987+03:00', 4, N'fan483@halk.com'),
(483, '2026-05-02T18:46:30.1336989+03:00', 4, N'fan484@halk.com'),
(484, '2026-05-02T18:46:30.1336991+03:00', 4, N'fan485@halk.com'),
(485, '2026-05-02T18:46:30.1336993+03:00', 4, N'fan486@halk.com'),
(486, '2026-05-02T18:46:30.1336995+03:00', 4, N'fan487@halk.com'),
(487, '2026-05-02T18:46:30.1336997+03:00', 4, N'fan488@halk.com'),
(488, '2026-05-02T18:46:30.1336999+03:00', 4, N'fan489@halk.com'),
(489, '2026-05-02T18:46:30.1337001+03:00', 4, N'fan490@halk.com'),
(490, '2026-05-02T18:46:30.1337003+03:00', 4, N'fan491@halk.com'),
(491, '2026-05-02T18:46:30.1337006+03:00', 4, N'fan492@halk.com'),
(492, '2026-05-02T18:46:30.1337008+03:00', 4, N'fan493@halk.com'),
(493, '2026-05-02T18:46:30.1337010+03:00', 4, N'fan494@halk.com'),
(494, '2026-05-02T18:46:30.1337021+03:00', 4, N'fan495@halk.com'),
(495, '2026-05-02T18:46:30.1337025+03:00', 4, N'fan496@halk.com'),
(496, '2026-05-02T18:46:30.1337027+03:00', 4, N'fan497@halk.com'),
(497, '2026-05-02T18:46:30.1337029+03:00', 4, N'fan498@halk.com'),
(498, '2026-05-02T18:46:30.1337031+03:00', 4, N'fan499@halk.com'),
(499, '2026-05-02T18:46:30.1337033+03:00', 4, N'fan500@halk.com'),
(500, '2026-05-02T18:46:30.1337035+03:00', 4, N'fan501@halk.com'),
(501, '2026-05-02T18:46:30.1337037+03:00', 4, N'fan502@halk.com'),
(502, '2026-05-02T18:46:30.1337039+03:00', 4, N'fan503@halk.com'),
(503, '2026-05-02T18:46:30.1337041+03:00', 4, N'fan504@halk.com'),
(504, '2026-05-02T18:46:30.1337043+03:00', 4, N'fan505@halk.com'),
(505, '2026-05-02T18:46:30.1337045+03:00', 4, N'fan506@halk.com'),
(506, '2026-05-02T18:46:30.1337047+03:00', 4, N'fan507@halk.com'),
(507, '2026-05-02T18:46:30.1337049+03:00', 4, N'fan508@halk.com'),
(508, '2026-05-02T18:46:30.1337052+03:00', 4, N'fan509@halk.com'),
(509, '2026-05-02T18:46:30.1337054+03:00', 4, N'fan510@halk.com'),
(510, '2026-05-02T18:46:30.1337056+03:00', 4, N'fan511@halk.com'),
(511, '2026-05-02T18:46:30.1337058+03:00', 4, N'fan512@halk.com'),
(512, '2026-05-02T18:46:30.1337060+03:00', 4, N'fan513@halk.com'),
(513, '2026-05-02T18:46:30.1337062+03:00', 4, N'fan514@halk.com'),
(514, '2026-05-02T18:46:30.1337079+03:00', 4, N'fan515@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (515, '2026-05-02T18:46:30.1337081+03:00', 4, N'fan516@halk.com'),
(516, '2026-05-02T18:46:30.1337083+03:00', 4, N'fan517@halk.com'),
(517, '2026-05-02T18:46:30.1337085+03:00', 4, N'fan518@halk.com'),
(518, '2026-05-02T18:46:30.1337087+03:00', 4, N'fan519@halk.com'),
(519, '2026-05-02T18:46:30.1337089+03:00', 4, N'fan520@halk.com'),
(520, '2026-05-02T18:46:30.1337091+03:00', 4, N'fan521@halk.com'),
(521, '2026-05-02T18:46:30.1337093+03:00', 4, N'fan522@halk.com'),
(522, '2026-05-02T18:46:30.1337095+03:00', 4, N'fan523@halk.com'),
(523, '2026-05-02T18:46:30.1337098+03:00', 4, N'fan524@halk.com'),
(524, '2026-05-02T18:46:30.1337100+03:00', 4, N'fan525@halk.com'),
(525, '2026-05-02T18:46:30.1337102+03:00', 4, N'fan526@halk.com'),
(526, '2026-05-02T18:46:30.1337104+03:00', 4, N'fan527@halk.com'),
(527, '2026-05-02T18:46:30.1337106+03:00', 4, N'fan528@halk.com'),
(528, '2026-05-02T18:46:30.1337108+03:00', 4, N'fan529@halk.com'),
(529, '2026-05-02T18:46:30.1337110+03:00', 4, N'fan530@halk.com'),
(530, '2026-05-02T18:46:30.1337112+03:00', 4, N'fan531@halk.com'),
(531, '2026-05-02T18:46:30.1337115+03:00', 4, N'fan532@halk.com'),
(532, '2026-05-02T18:46:30.1337117+03:00', 4, N'fan533@halk.com'),
(533, '2026-05-02T18:46:30.1337119+03:00', 4, N'fan534@halk.com'),
(534, '2026-05-02T18:46:30.1337121+03:00', 4, N'fan535@halk.com'),
(535, '2026-05-02T18:46:30.1337129+03:00', 5, N'fan536@halk.com'),
(536, '2026-05-02T18:46:30.1337131+03:00', 5, N'fan537@halk.com'),
(537, '2026-05-02T18:46:30.1337133+03:00', 5, N'fan538@halk.com'),
(538, '2026-05-02T18:46:30.1337135+03:00', 5, N'fan539@halk.com'),
(539, '2026-05-02T18:46:30.1337137+03:00', 5, N'fan540@halk.com'),
(540, '2026-05-02T18:46:30.1337139+03:00', 5, N'fan541@halk.com'),
(541, '2026-05-02T18:46:30.1337141+03:00', 5, N'fan542@halk.com'),
(542, '2026-05-02T18:46:30.1337143+03:00', 5, N'fan543@halk.com'),
(543, '2026-05-02T18:46:30.1337146+03:00', 5, N'fan544@halk.com'),
(544, '2026-05-02T18:46:30.1337148+03:00', 5, N'fan545@halk.com'),
(545, '2026-05-02T18:46:30.1337150+03:00', 5, N'fan546@halk.com'),
(546, '2026-05-02T18:46:30.1337152+03:00', 5, N'fan547@halk.com'),
(547, '2026-05-02T18:46:30.1337154+03:00', 5, N'fan548@halk.com'),
(548, '2026-05-02T18:46:30.1337156+03:00', 5, N'fan549@halk.com'),
(549, '2026-05-02T18:46:30.1337158+03:00', 5, N'fan550@halk.com'),
(550, '2026-05-02T18:46:30.1337160+03:00', 5, N'fan551@halk.com'),
(551, '2026-05-02T18:46:30.1337163+03:00', 5, N'fan552@halk.com'),
(552, '2026-05-02T18:46:30.1337165+03:00', 5, N'fan553@halk.com'),
(553, '2026-05-02T18:46:30.1337167+03:00', 5, N'fan554@halk.com'),
(554, '2026-05-02T18:46:30.1337169+03:00', 5, N'fan555@halk.com'),
(555, '2026-05-02T18:46:30.1337171+03:00', 5, N'fan556@halk.com'),
(556, '2026-05-02T18:46:30.1337173+03:00', 5, N'fan557@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (557, '2026-05-02T18:46:30.1337175+03:00', 5, N'fan558@halk.com'),
(558, '2026-05-02T18:46:30.1337177+03:00', 5, N'fan559@halk.com'),
(559, '2026-05-02T18:46:30.1337179+03:00', 5, N'fan560@halk.com'),
(560, '2026-05-02T18:46:30.1337181+03:00', 5, N'fan561@halk.com'),
(561, '2026-05-02T18:46:30.1337183+03:00', 5, N'fan562@halk.com'),
(562, '2026-05-02T18:46:30.1337185+03:00', 5, N'fan563@halk.com'),
(563, '2026-05-02T18:46:30.1337187+03:00', 5, N'fan564@halk.com'),
(564, '2026-05-02T18:46:30.1337189+03:00', 5, N'fan565@halk.com'),
(565, '2026-05-02T18:46:30.1337191+03:00', 5, N'fan566@halk.com'),
(566, '2026-05-02T18:46:30.1337193+03:00', 5, N'fan567@halk.com'),
(567, '2026-05-02T18:46:30.1337195+03:00', 5, N'fan568@halk.com'),
(568, '2026-05-02T18:46:30.1337198+03:00', 5, N'fan569@halk.com'),
(569, '2026-05-02T18:46:30.1337200+03:00', 5, N'fan570@halk.com'),
(570, '2026-05-02T18:46:30.1337202+03:00', 5, N'fan571@halk.com'),
(571, '2026-05-02T18:46:30.1337214+03:00', 5, N'fan572@halk.com'),
(572, '2026-05-02T18:46:30.1337218+03:00', 5, N'fan573@halk.com'),
(573, '2026-05-02T18:46:30.1337220+03:00', 5, N'fan574@halk.com'),
(574, '2026-05-02T18:46:30.1337222+03:00', 5, N'fan575@halk.com'),
(575, '2026-05-02T18:46:30.1337224+03:00', 5, N'fan576@halk.com'),
(576, '2026-05-02T18:46:30.1337226+03:00', 5, N'fan577@halk.com'),
(577, '2026-05-02T18:46:30.1337228+03:00', 5, N'fan578@halk.com'),
(578, '2026-05-02T18:46:30.1337230+03:00', 5, N'fan579@halk.com'),
(579, '2026-05-02T18:46:30.1337232+03:00', 5, N'fan580@halk.com'),
(580, '2026-05-02T18:46:30.1337234+03:00', 5, N'fan581@halk.com'),
(581, '2026-05-02T18:46:30.1337236+03:00', 5, N'fan582@halk.com'),
(582, '2026-05-02T18:46:30.1337238+03:00', 5, N'fan583@halk.com'),
(583, '2026-05-02T18:46:30.1337240+03:00', 5, N'fan584@halk.com'),
(584, '2026-05-02T18:46:30.1337242+03:00', 5, N'fan585@halk.com'),
(585, '2026-05-02T18:46:30.1337244+03:00', 5, N'fan586@halk.com'),
(586, '2026-05-02T18:46:30.1337246+03:00', 5, N'fan587@halk.com'),
(587, '2026-05-02T18:46:30.1337248+03:00', 5, N'fan588@halk.com'),
(588, '2026-05-02T18:46:30.1337250+03:00', 5, N'fan589@halk.com'),
(589, '2026-05-02T18:46:30.1337252+03:00', 5, N'fan590@halk.com'),
(590, '2026-05-02T18:46:30.1337254+03:00', 5, N'fan591@halk.com'),
(591, '2026-05-02T18:46:30.1337256+03:00', 5, N'fan592@halk.com'),
(592, '2026-05-02T18:46:30.1337258+03:00', 5, N'fan593@halk.com'),
(593, '2026-05-02T18:46:30.1337260+03:00', 5, N'fan594@halk.com'),
(594, '2026-05-02T18:46:30.1337262+03:00', 5, N'fan595@halk.com'),
(595, '2026-05-02T18:46:30.1337264+03:00', 5, N'fan596@halk.com'),
(596, '2026-05-02T18:46:30.1337267+03:00', 5, N'fan597@halk.com'),
(597, '2026-05-02T18:46:30.1337269+03:00', 5, N'fan598@halk.com'),
(598, '2026-05-02T18:46:30.1337271+03:00', 5, N'fan599@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (599, '2026-05-02T18:46:30.1337273+03:00', 5, N'fan600@halk.com'),
(600, '2026-05-02T18:46:30.1337274+03:00', 5, N'fan601@halk.com'),
(601, '2026-05-02T18:46:30.1337277+03:00', 5, N'fan602@halk.com'),
(602, '2026-05-02T18:46:30.1337279+03:00', 5, N'fan603@halk.com'),
(603, '2026-05-02T18:46:30.1337281+03:00', 5, N'fan604@halk.com'),
(604, '2026-05-02T18:46:30.1337283+03:00', 5, N'fan605@halk.com'),
(605, '2026-05-02T18:46:30.1337285+03:00', 5, N'fan606@halk.com'),
(606, '2026-05-02T18:46:30.1337287+03:00', 5, N'fan607@halk.com'),
(607, '2026-05-02T18:46:30.1337289+03:00', 5, N'fan608@halk.com'),
(608, '2026-05-02T18:46:30.1337291+03:00', 5, N'fan609@halk.com'),
(609, '2026-05-02T18:46:30.1337293+03:00', 5, N'fan610@halk.com'),
(610, '2026-05-02T18:46:30.1337295+03:00', 5, N'fan611@halk.com'),
(611, '2026-05-02T18:46:30.1337297+03:00', 5, N'fan612@halk.com'),
(612, '2026-05-02T18:46:30.1337299+03:00', 5, N'fan613@halk.com'),
(613, '2026-05-02T18:46:30.1337301+03:00', 5, N'fan614@halk.com'),
(614, '2026-05-02T18:46:30.1337303+03:00', 5, N'fan615@halk.com'),
(615, '2026-05-02T18:46:30.1337305+03:00', 5, N'fan616@halk.com'),
(616, '2026-05-02T18:46:30.1337307+03:00', 5, N'fan617@halk.com'),
(617, '2026-05-02T18:46:30.1337309+03:00', 5, N'fan618@halk.com'),
(618, '2026-05-02T18:46:30.1337312+03:00', 5, N'fan619@halk.com'),
(619, '2026-05-02T18:46:30.1337314+03:00', 5, N'fan620@halk.com'),
(620, '2026-05-02T18:46:30.1337316+03:00', 5, N'fan621@halk.com'),
(621, '2026-05-02T18:46:30.1337318+03:00', 5, N'fan622@halk.com'),
(622, '2026-05-02T18:46:30.1337320+03:00', 5, N'fan623@halk.com'),
(623, '2026-05-02T18:46:30.1337322+03:00', 5, N'fan624@halk.com'),
(624, '2026-05-02T18:46:30.1337324+03:00', 5, N'fan625@halk.com'),
(625, '2026-05-02T18:46:30.1337326+03:00', 5, N'fan626@halk.com'),
(626, '2026-05-02T18:46:30.1337328+03:00', 5, N'fan627@halk.com'),
(627, '2026-05-02T18:46:30.1337329+03:00', 5, N'fan628@halk.com'),
(628, '2026-05-02T18:46:30.1337332+03:00', 5, N'fan629@halk.com'),
(629, '2026-05-02T18:46:30.1337334+03:00', 5, N'fan630@halk.com'),
(630, '2026-05-02T18:46:30.1337336+03:00', 5, N'fan631@halk.com'),
(631, '2026-05-02T18:46:30.1337338+03:00', 5, N'fan632@halk.com'),
(632, '2026-05-02T18:46:30.1337340+03:00', 5, N'fan633@halk.com'),
(633, '2026-05-02T18:46:30.1337342+03:00', 5, N'fan634@halk.com'),
(634, '2026-05-02T18:46:30.1337344+03:00', 5, N'fan635@halk.com'),
(635, '2026-05-02T18:46:30.1337346+03:00', 5, N'fan636@halk.com'),
(636, '2026-05-02T18:46:30.1337348+03:00', 5, N'fan637@halk.com'),
(637, '2026-05-02T18:46:30.1337350+03:00', 5, N'fan638@halk.com'),
(638, '2026-05-02T18:46:30.1337352+03:00', 5, N'fan639@halk.com'),
(639, '2026-05-02T18:46:30.1337354+03:00', 5, N'fan640@halk.com'),
(640, '2026-05-02T18:46:30.1337356+03:00', 5, N'fan641@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (641, '2026-05-02T18:46:30.1337359+03:00', 5, N'fan642@halk.com'),
(642, '2026-05-02T18:46:30.1337361+03:00', 5, N'fan643@halk.com'),
(643, '2026-05-02T18:46:30.1337363+03:00', 5, N'fan644@halk.com'),
(644, '2026-05-02T18:46:30.1337365+03:00', 5, N'fan645@halk.com'),
(645, '2026-05-02T18:46:30.1337367+03:00', 5, N'fan646@halk.com'),
(646, '2026-05-02T18:46:30.1337369+03:00', 5, N'fan647@halk.com'),
(647, '2026-05-02T18:46:30.1337393+03:00', 6, N'fan648@halk.com'),
(648, '2026-05-02T18:46:30.1337395+03:00', 6, N'fan649@halk.com'),
(649, '2026-05-02T18:46:30.1337397+03:00', 6, N'fan650@halk.com'),
(650, '2026-05-02T18:46:30.1337399+03:00', 6, N'fan651@halk.com'),
(651, '2026-05-02T18:46:30.1337401+03:00', 6, N'fan652@halk.com'),
(652, '2026-05-02T18:46:30.1337403+03:00', 6, N'fan653@halk.com'),
(653, '2026-05-02T18:46:30.1337405+03:00', 6, N'fan654@halk.com'),
(654, '2026-05-02T18:46:30.1337407+03:00', 6, N'fan655@halk.com'),
(655, '2026-05-02T18:46:30.1337409+03:00', 6, N'fan656@halk.com'),
(656, '2026-05-02T18:46:30.1337411+03:00', 6, N'fan657@halk.com'),
(657, '2026-05-02T18:46:30.1337413+03:00', 6, N'fan658@halk.com'),
(658, '2026-05-02T18:46:30.1337415+03:00', 6, N'fan659@halk.com'),
(659, '2026-05-02T18:46:30.1337418+03:00', 6, N'fan660@halk.com'),
(660, '2026-05-02T18:46:30.1337420+03:00', 6, N'fan661@halk.com'),
(661, '2026-05-02T18:46:30.1337422+03:00', 6, N'fan662@halk.com'),
(662, '2026-05-02T18:46:30.1337424+03:00', 6, N'fan663@halk.com'),
(663, '2026-05-02T18:46:30.1337426+03:00', 6, N'fan664@halk.com'),
(664, '2026-05-02T18:46:30.1337428+03:00', 6, N'fan665@halk.com'),
(665, '2026-05-02T18:46:30.1337430+03:00', 6, N'fan666@halk.com'),
(666, '2026-05-02T18:46:30.1337432+03:00', 6, N'fan667@halk.com'),
(667, '2026-05-02T18:46:30.1337434+03:00', 6, N'fan668@halk.com'),
(668, '2026-05-02T18:46:30.1337436+03:00', 6, N'fan669@halk.com'),
(669, '2026-05-02T18:46:30.1337438+03:00', 6, N'fan670@halk.com'),
(670, '2026-05-02T18:46:30.1337440+03:00', 6, N'fan671@halk.com'),
(671, '2026-05-02T18:46:30.1337442+03:00', 6, N'fan672@halk.com'),
(672, '2026-05-02T18:46:30.1337444+03:00', 6, N'fan673@halk.com'),
(673, '2026-05-02T18:46:30.1337446+03:00', 6, N'fan674@halk.com'),
(674, '2026-05-02T18:46:30.1337448+03:00', 6, N'fan675@halk.com'),
(675, '2026-05-02T18:46:30.1337450+03:00', 6, N'fan676@halk.com'),
(676, '2026-05-02T18:46:30.1337452+03:00', 6, N'fan677@halk.com'),
(677, '2026-05-02T18:46:30.1337454+03:00', 6, N'fan678@halk.com'),
(678, '2026-05-02T18:46:30.1337457+03:00', 6, N'fan679@halk.com'),
(679, '2026-05-02T18:46:30.1337459+03:00', 6, N'fan680@halk.com'),
(680, '2026-05-02T18:46:30.1337461+03:00', 6, N'fan681@halk.com'),
(681, '2026-05-02T18:46:30.1337463+03:00', 6, N'fan682@halk.com'),
(682, '2026-05-02T18:46:30.1337465+03:00', 6, N'fan683@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (683, '2026-05-02T18:46:30.1337467+03:00', 6, N'fan684@halk.com'),
(684, '2026-05-02T18:46:30.1337469+03:00', 6, N'fan685@halk.com'),
(685, '2026-05-02T18:46:30.1337471+03:00', 6, N'fan686@halk.com'),
(686, '2026-05-02T18:46:30.1337473+03:00', 6, N'fan687@halk.com'),
(687, '2026-05-02T18:46:30.1337475+03:00', 6, N'fan688@halk.com'),
(688, '2026-05-02T18:46:30.1337477+03:00', 6, N'fan689@halk.com'),
(689, '2026-05-02T18:46:30.1337479+03:00', 6, N'fan690@halk.com'),
(690, '2026-05-02T18:46:30.1337481+03:00', 6, N'fan691@halk.com'),
(691, '2026-05-02T18:46:30.1337483+03:00', 6, N'fan692@halk.com'),
(692, '2026-05-02T18:46:30.1337485+03:00', 6, N'fan693@halk.com'),
(693, '2026-05-02T18:46:30.1337487+03:00', 6, N'fan694@halk.com'),
(694, '2026-05-02T18:46:30.1337489+03:00', 6, N'fan695@halk.com'),
(695, '2026-05-02T18:46:30.1337491+03:00', 6, N'fan696@halk.com'),
(696, '2026-05-02T18:46:30.1337493+03:00', 6, N'fan697@halk.com'),
(697, '2026-05-02T18:46:30.1337495+03:00', 6, N'fan698@halk.com'),
(698, '2026-05-02T18:46:30.1337497+03:00', 6, N'fan699@halk.com'),
(699, '2026-05-02T18:46:30.1337499+03:00', 6, N'fan700@halk.com'),
(700, '2026-05-02T18:46:30.1337501+03:00', 6, N'fan701@halk.com'),
(701, '2026-05-02T18:46:30.1337504+03:00', 6, N'fan702@halk.com'),
(702, '2026-05-02T18:46:30.1337506+03:00', 6, N'fan703@halk.com'),
(703, '2026-05-02T18:46:30.1337508+03:00', 6, N'fan704@halk.com'),
(704, '2026-05-02T18:46:30.1337510+03:00', 6, N'fan705@halk.com'),
(705, '2026-05-02T18:46:30.1337512+03:00', 6, N'fan706@halk.com'),
(706, '2026-05-02T18:46:30.1337514+03:00', 6, N'fan707@halk.com'),
(707, '2026-05-02T18:46:30.1337516+03:00', 6, N'fan708@halk.com'),
(708, '2026-05-02T18:46:30.1337517+03:00', 6, N'fan709@halk.com'),
(709, '2026-05-02T18:46:30.1337519+03:00', 6, N'fan710@halk.com'),
(710, '2026-05-02T18:46:30.1337521+03:00', 6, N'fan711@halk.com'),
(711, '2026-05-02T18:46:30.1337523+03:00', 6, N'fan712@halk.com'),
(712, '2026-05-02T18:46:30.1337525+03:00', 6, N'fan713@halk.com'),
(713, '2026-05-02T18:46:30.1337527+03:00', 6, N'fan714@halk.com'),
(714, '2026-05-02T18:46:30.1337529+03:00', 6, N'fan715@halk.com'),
(715, '2026-05-02T18:46:30.1337531+03:00', 6, N'fan716@halk.com'),
(716, '2026-05-02T18:46:30.1337533+03:00', 6, N'fan717@halk.com'),
(717, '2026-05-02T18:46:30.1337535+03:00', 6, N'fan718@halk.com'),
(718, '2026-05-02T18:46:30.1337538+03:00', 6, N'fan719@halk.com'),
(719, '2026-05-02T18:46:30.1337540+03:00', 6, N'fan720@halk.com'),
(720, '2026-05-02T18:46:30.1337542+03:00', 6, N'fan721@halk.com'),
(721, '2026-05-02T18:46:30.1337544+03:00', 6, N'fan722@halk.com'),
(722, '2026-05-02T18:46:30.1337546+03:00', 6, N'fan723@halk.com'),
(723, '2026-05-02T18:46:30.1337548+03:00', 6, N'fan724@halk.com'),
(724, '2026-05-02T18:46:30.1337550+03:00', 6, N'fan725@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (725, '2026-05-02T18:46:30.1337569+03:00', 6, N'fan726@halk.com'),
(726, '2026-05-02T18:46:30.1337571+03:00', 6, N'fan727@halk.com'),
(727, '2026-05-02T18:46:30.1337573+03:00', 6, N'fan728@halk.com'),
(728, '2026-05-02T18:46:30.1337575+03:00', 6, N'fan729@halk.com'),
(729, '2026-05-02T18:46:30.1337577+03:00', 6, N'fan730@halk.com'),
(730, '2026-05-02T18:46:30.1337579+03:00', 6, N'fan731@halk.com'),
(731, '2026-05-02T18:46:30.1337581+03:00', 6, N'fan732@halk.com'),
(732, '2026-05-02T18:46:30.1337583+03:00', 6, N'fan733@halk.com'),
(733, '2026-05-02T18:46:30.1337585+03:00', 6, N'fan734@halk.com'),
(734, '2026-05-02T18:46:30.1337588+03:00', 6, N'fan735@halk.com'),
(735, '2026-05-02T18:46:30.1337590+03:00', 6, N'fan736@halk.com'),
(736, '2026-05-02T18:46:30.1337592+03:00', 6, N'fan737@halk.com'),
(737, '2026-05-02T18:46:30.1337594+03:00', 6, N'fan738@halk.com'),
(738, '2026-05-02T18:46:30.1337596+03:00', 6, N'fan739@halk.com'),
(739, '2026-05-02T18:46:30.1337598+03:00', 6, N'fan740@halk.com'),
(740, '2026-05-02T18:46:30.1337600+03:00', 6, N'fan741@halk.com'),
(741, '2026-05-02T18:46:30.1337602+03:00', 6, N'fan742@halk.com'),
(742, '2026-05-02T18:46:30.1337604+03:00', 6, N'fan743@halk.com'),
(743, '2026-05-02T18:46:30.1337606+03:00', 6, N'fan744@halk.com'),
(744, '2026-05-02T18:46:30.1337608+03:00', 6, N'fan745@halk.com'),
(745, '2026-05-02T18:46:30.1337610+03:00', 6, N'fan746@halk.com'),
(746, '2026-05-02T18:46:30.1337612+03:00', 6, N'fan747@halk.com'),
(747, '2026-05-02T18:46:30.1337614+03:00', 6, N'fan748@halk.com'),
(748, '2026-05-02T18:46:30.1337616+03:00', 6, N'fan749@halk.com'),
(749, '2026-05-02T18:46:30.1337618+03:00', 6, N'fan750@halk.com'),
(750, '2026-05-02T18:46:30.1337619+03:00', 6, N'fan751@halk.com'),
(751, '2026-05-02T18:46:30.1337622+03:00', 6, N'fan752@halk.com'),
(752, '2026-05-02T18:46:30.1337624+03:00', 6, N'fan753@halk.com'),
(753, '2026-05-02T18:46:30.1337626+03:00', 6, N'fan754@halk.com'),
(754, '2026-05-02T18:46:30.1337628+03:00', 6, N'fan755@halk.com'),
(755, '2026-05-02T18:46:30.1337630+03:00', 6, N'fan756@halk.com'),
(756, '2026-05-02T18:46:30.1337632+03:00', 6, N'fan757@halk.com'),
(757, '2026-05-02T18:46:30.1337634+03:00', 6, N'fan758@halk.com'),
(758, '2026-05-02T18:46:30.1337636+03:00', 6, N'fan759@halk.com'),
(759, '2026-05-02T18:46:30.1337638+03:00', 6, N'fan760@halk.com'),
(760, '2026-05-02T18:46:30.1337640+03:00', 6, N'fan761@halk.com'),
(761, '2026-05-02T18:46:30.1337642+03:00', 6, N'fan762@halk.com'),
(762, '2026-05-02T18:46:30.1337644+03:00', 6, N'fan763@halk.com'),
(763, '2026-05-02T18:46:30.1337646+03:00', 6, N'fan764@halk.com'),
(764, '2026-05-02T18:46:30.1337648+03:00', 6, N'fan765@halk.com'),
(765, '2026-05-02T18:46:30.1337650+03:00', 6, N'fan766@halk.com'),
(766, '2026-05-02T18:46:30.1337652+03:00', 6, N'fan767@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (767, '2026-05-02T18:46:30.1337654+03:00', 6, N'fan768@halk.com'),
(768, '2026-05-02T18:46:30.1337657+03:00', 6, N'fan769@halk.com'),
(769, '2026-05-02T18:46:30.1337659+03:00', 6, N'fan770@halk.com'),
(770, '2026-05-02T18:46:30.1337661+03:00', 6, N'fan771@halk.com'),
(771, '2026-05-02T18:46:30.1337663+03:00', 6, N'fan772@halk.com'),
(772, '2026-05-02T18:46:30.1337665+03:00', 6, N'fan773@halk.com'),
(773, '2026-05-02T18:46:30.1337667+03:00', 6, N'fan774@halk.com'),
(774, '2026-05-02T18:46:30.1337669+03:00', 6, N'fan775@halk.com'),
(775, '2026-05-02T18:46:30.1337671+03:00', 6, N'fan776@halk.com'),
(776, '2026-05-02T18:46:30.1337673+03:00', 6, N'fan777@halk.com'),
(777, '2026-05-02T18:46:30.1337675+03:00', 6, N'fan778@halk.com'),
(778, '2026-05-02T18:46:30.1337677+03:00', 6, N'fan779@halk.com'),
(779, '2026-05-02T18:46:30.1337679+03:00', 6, N'fan780@halk.com'),
(780, '2026-05-02T18:46:30.1337681+03:00', 6, N'fan781@halk.com'),
(781, '2026-05-02T18:46:30.1337683+03:00', 6, N'fan782@halk.com'),
(782, '2026-05-02T18:46:30.1337685+03:00', 6, N'fan783@halk.com'),
(783, '2026-05-02T18:46:30.1337687+03:00', 6, N'fan784@halk.com'),
(784, '2026-05-02T18:46:30.1337689+03:00', 6, N'fan785@halk.com'),
(785, '2026-05-02T18:46:30.1337691+03:00', 6, N'fan786@halk.com'),
(786, '2026-05-02T18:46:30.1337694+03:00', 6, N'fan787@halk.com'),
(787, '2026-05-02T18:46:30.1337696+03:00', 6, N'fan788@halk.com'),
(788, '2026-05-02T18:46:30.1337698+03:00', 6, N'fan789@halk.com'),
(789, '2026-05-02T18:46:30.1337700+03:00', 6, N'fan790@halk.com'),
(790, '2026-05-02T18:46:30.1337702+03:00', 6, N'fan791@halk.com'),
(791, '2026-05-02T18:46:30.1337704+03:00', 6, N'fan792@halk.com'),
(792, '2026-05-02T18:46:30.1337706+03:00', 6, N'fan793@halk.com'),
(793, '2026-05-02T18:46:30.1337708+03:00', 6, N'fan794@halk.com'),
(794, '2026-05-02T18:46:30.1337709+03:00', 6, N'fan795@halk.com'),
(795, '2026-05-02T18:46:30.1337712+03:00', 6, N'fan796@halk.com'),
(796, '2026-05-02T18:46:30.1337714+03:00', 6, N'fan797@halk.com'),
(797, '2026-05-02T18:46:30.1337716+03:00', 6, N'fan798@halk.com'),
(798, '2026-05-02T18:46:30.1337717+03:00', 6, N'fan799@halk.com'),
(799, '2026-05-02T18:46:30.1337719+03:00', 6, N'fan800@halk.com'),
(800, '2026-05-02T18:46:30.1337721+03:00', 6, N'fan801@halk.com'),
(801, '2026-05-02T18:46:30.1337723+03:00', 6, N'fan802@halk.com'),
(802, '2026-05-02T18:46:30.1337726+03:00', 6, N'fan803@halk.com'),
(803, '2026-05-02T18:46:30.1337728+03:00', 6, N'fan804@halk.com'),
(804, '2026-05-02T18:46:30.1337741+03:00', 6, N'fan805@halk.com'),
(805, '2026-05-02T18:46:30.1337743+03:00', 6, N'fan806@halk.com'),
(806, '2026-05-02T18:46:30.1337745+03:00', 6, N'fan807@halk.com'),
(807, '2026-05-02T18:46:30.1337747+03:00', 6, N'fan808@halk.com'),
(808, '2026-05-02T18:46:30.1337749+03:00', 6, N'fan809@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (809, '2026-05-02T18:46:30.1337751+03:00', 6, N'fan810@halk.com'),
(810, '2026-05-02T18:46:30.1337753+03:00', 6, N'fan811@halk.com'),
(811, '2026-05-02T18:46:30.1337755+03:00', 6, N'fan812@halk.com'),
(812, '2026-05-02T18:46:30.1337757+03:00', 6, N'fan813@halk.com'),
(813, '2026-05-02T18:46:30.1337759+03:00', 6, N'fan814@halk.com'),
(814, '2026-05-02T18:46:30.1337761+03:00', 6, N'fan815@halk.com'),
(815, '2026-05-02T18:46:30.1337763+03:00', 6, N'fan816@halk.com'),
(816, '2026-05-02T18:46:30.1337766+03:00', 6, N'fan817@halk.com'),
(817, '2026-05-02T18:46:30.1337769+03:00', 6, N'fan818@halk.com'),
(818, '2026-05-02T18:46:30.1337771+03:00', 6, N'fan819@halk.com'),
(819, '2026-05-02T18:46:30.1337772+03:00', 6, N'fan820@halk.com'),
(820, '2026-05-02T18:46:30.1337774+03:00', 6, N'fan821@halk.com'),
(821, '2026-05-02T18:46:30.1337777+03:00', 6, N'fan822@halk.com'),
(822, '2026-05-02T18:46:30.1337779+03:00', 6, N'fan823@halk.com'),
(823, '2026-05-02T18:46:30.1337782+03:00', 6, N'fan824@halk.com'),
(824, '2026-05-02T18:46:30.1337784+03:00', 6, N'fan825@halk.com'),
(825, '2026-05-02T18:46:30.1337786+03:00', 6, N'fan826@halk.com'),
(826, '2026-05-02T18:46:30.1337788+03:00', 6, N'fan827@halk.com'),
(827, '2026-05-02T18:46:30.1337790+03:00', 6, N'fan828@halk.com'),
(828, '2026-05-02T18:46:30.1337792+03:00', 6, N'fan829@halk.com'),
(829, '2026-05-02T18:46:30.1337794+03:00', 6, N'fan830@halk.com'),
(830, '2026-05-02T18:46:30.1337796+03:00', 6, N'fan831@halk.com'),
(831, '2026-05-02T18:46:30.1337798+03:00', 6, N'fan832@halk.com'),
(832, '2026-05-02T18:46:30.1337800+03:00', 6, N'fan833@halk.com'),
(833, '2026-05-02T18:46:30.1337802+03:00', 6, N'fan834@halk.com'),
(834, '2026-05-02T18:46:30.1337804+03:00', 6, N'fan835@halk.com'),
(835, '2026-05-02T18:46:30.1337806+03:00', 6, N'fan836@halk.com'),
(836, '2026-05-02T18:46:30.1337808+03:00', 6, N'fan837@halk.com'),
(837, '2026-05-02T18:46:30.1337810+03:00', 6, N'fan838@halk.com'),
(838, '2026-05-02T18:46:30.1337812+03:00', 6, N'fan839@halk.com'),
(839, '2026-05-02T18:46:30.1337815+03:00', 6, N'fan840@halk.com'),
(840, '2026-05-02T18:46:30.1337817+03:00', 6, N'fan841@halk.com'),
(841, '2026-05-02T18:46:30.1337819+03:00', 6, N'fan842@halk.com'),
(842, '2026-05-02T18:46:30.1337821+03:00', 6, N'fan843@halk.com'),
(843, '2026-05-02T18:46:30.1337823+03:00', 6, N'fan844@halk.com'),
(844, '2026-05-02T18:46:30.1337826+03:00', 6, N'fan845@halk.com'),
(845, '2026-05-02T18:46:30.1337834+03:00', 7, N'fan846@halk.com'),
(846, '2026-05-02T18:46:30.1337836+03:00', 7, N'fan847@halk.com'),
(847, '2026-05-02T18:46:30.1337838+03:00', 7, N'fan848@halk.com'),
(848, '2026-05-02T18:46:30.1337840+03:00', 7, N'fan849@halk.com'),
(849, '2026-05-02T18:46:30.1337842+03:00', 7, N'fan850@halk.com'),
(850, '2026-05-02T18:46:30.1337844+03:00', 7, N'fan851@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (851, '2026-05-02T18:46:30.1337846+03:00', 7, N'fan852@halk.com'),
(852, '2026-05-02T18:46:30.1337848+03:00', 7, N'fan853@halk.com'),
(853, '2026-05-02T18:46:30.1337850+03:00', 7, N'fan854@halk.com'),
(854, '2026-05-02T18:46:30.1337852+03:00', 7, N'fan855@halk.com'),
(855, '2026-05-02T18:46:30.1337854+03:00', 7, N'fan856@halk.com'),
(856, '2026-05-02T18:46:30.1337856+03:00', 7, N'fan857@halk.com'),
(857, '2026-05-02T18:46:30.1337858+03:00', 7, N'fan858@halk.com'),
(858, '2026-05-02T18:46:30.1337860+03:00', 7, N'fan859@halk.com'),
(859, '2026-05-02T18:46:30.1337862+03:00', 7, N'fan860@halk.com'),
(860, '2026-05-02T18:46:30.1337864+03:00', 7, N'fan861@halk.com'),
(861, '2026-05-02T18:46:30.1337866+03:00', 7, N'fan862@halk.com'),
(862, '2026-05-02T18:46:30.1337869+03:00', 7, N'fan863@halk.com'),
(863, '2026-05-02T18:46:30.1337871+03:00', 7, N'fan864@halk.com'),
(864, '2026-05-02T18:46:30.1337873+03:00', 7, N'fan865@halk.com'),
(865, '2026-05-02T18:46:30.1337875+03:00', 7, N'fan866@halk.com'),
(866, '2026-05-02T18:46:30.1337877+03:00', 7, N'fan867@halk.com'),
(867, '2026-05-02T18:46:30.1337879+03:00', 7, N'fan868@halk.com'),
(868, '2026-05-02T18:46:30.1337881+03:00', 7, N'fan869@halk.com'),
(869, '2026-05-02T18:46:30.1337883+03:00', 7, N'fan870@halk.com'),
(870, '2026-05-02T18:46:30.1337885+03:00', 7, N'fan871@halk.com'),
(871, '2026-05-02T18:46:30.1337887+03:00', 7, N'fan872@halk.com'),
(872, '2026-05-02T18:46:30.1337889+03:00', 7, N'fan873@halk.com'),
(873, '2026-05-02T18:46:30.1337891+03:00', 7, N'fan874@halk.com'),
(874, '2026-05-02T18:46:30.1337893+03:00', 7, N'fan875@halk.com'),
(875, '2026-05-02T18:46:30.1337895+03:00', 7, N'fan876@halk.com'),
(876, '2026-05-02T18:46:30.1337897+03:00', 7, N'fan877@halk.com'),
(877, '2026-05-02T18:46:30.1337899+03:00', 7, N'fan878@halk.com'),
(878, '2026-05-02T18:46:30.1337901+03:00', 7, N'fan879@halk.com'),
(879, '2026-05-02T18:46:30.1337904+03:00', 7, N'fan880@halk.com'),
(880, '2026-05-02T18:46:30.1337914+03:00', 7, N'fan881@halk.com'),
(881, '2026-05-02T18:46:30.1337918+03:00', 7, N'fan882@halk.com'),
(882, '2026-05-02T18:46:30.1337920+03:00', 7, N'fan883@halk.com'),
(883, '2026-05-02T18:46:30.1337922+03:00', 7, N'fan884@halk.com'),
(884, '2026-05-02T18:46:30.1337924+03:00', 7, N'fan885@halk.com'),
(885, '2026-05-02T18:46:30.1337926+03:00', 7, N'fan886@halk.com'),
(886, '2026-05-02T18:46:30.1337928+03:00', 7, N'fan887@halk.com'),
(887, '2026-05-02T18:46:30.1337930+03:00', 7, N'fan888@halk.com'),
(888, '2026-05-02T18:46:30.1337932+03:00', 7, N'fan889@halk.com'),
(889, '2026-05-02T18:46:30.1337934+03:00', 7, N'fan890@halk.com'),
(890, '2026-05-02T18:46:30.1337936+03:00', 7, N'fan891@halk.com'),
(891, '2026-05-02T18:46:30.1337938+03:00', 7, N'fan892@halk.com'),
(892, '2026-05-02T18:46:30.1337940+03:00', 7, N'fan893@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (893, '2026-05-02T18:46:30.1337942+03:00', 7, N'fan894@halk.com'),
(894, '2026-05-02T18:46:30.1337944+03:00', 7, N'fan895@halk.com'),
(895, '2026-05-02T18:46:30.1337947+03:00', 7, N'fan896@halk.com'),
(896, '2026-05-02T18:46:30.1337949+03:00', 7, N'fan897@halk.com'),
(897, '2026-05-02T18:46:30.1337951+03:00', 7, N'fan898@halk.com'),
(898, '2026-05-02T18:46:30.1337953+03:00', 7, N'fan899@halk.com'),
(899, '2026-05-02T18:46:30.1337955+03:00', 7, N'fan900@halk.com'),
(900, '2026-05-02T18:46:30.1337957+03:00', 7, N'fan901@halk.com'),
(901, '2026-05-02T18:46:30.1337959+03:00', 7, N'fan902@halk.com'),
(902, '2026-05-02T18:46:30.1337961+03:00', 7, N'fan903@halk.com'),
(903, '2026-05-02T18:46:30.1337963+03:00', 7, N'fan904@halk.com'),
(904, '2026-05-02T18:46:30.1337965+03:00', 7, N'fan905@halk.com'),
(905, '2026-05-02T18:46:30.1337967+03:00', 7, N'fan906@halk.com'),
(906, '2026-05-02T18:46:30.1337969+03:00', 7, N'fan907@halk.com'),
(907, '2026-05-02T18:46:30.1337971+03:00', 7, N'fan908@halk.com'),
(908, '2026-05-02T18:46:30.1337973+03:00', 7, N'fan909@halk.com'),
(909, '2026-05-02T18:46:30.1337975+03:00', 7, N'fan910@halk.com'),
(910, '2026-05-02T18:46:30.1337977+03:00', 7, N'fan911@halk.com'),
(911, '2026-05-02T18:46:30.1337979+03:00', 7, N'fan912@halk.com'),
(912, '2026-05-02T18:46:30.1337982+03:00', 7, N'fan913@halk.com'),
(913, '2026-05-02T18:46:30.1337984+03:00', 7, N'fan914@halk.com'),
(914, '2026-05-02T18:46:30.1337986+03:00', 7, N'fan915@halk.com'),
(915, '2026-05-02T18:46:30.1337988+03:00', 7, N'fan916@halk.com'),
(916, '2026-05-02T18:46:30.1337990+03:00', 7, N'fan917@halk.com'),
(917, '2026-05-02T18:46:30.1337992+03:00', 7, N'fan918@halk.com'),
(918, '2026-05-02T18:46:30.1337994+03:00', 7, N'fan919@halk.com'),
(919, '2026-05-02T18:46:30.1337996+03:00', 7, N'fan920@halk.com'),
(920, '2026-05-02T18:46:30.1337998+03:00', 7, N'fan921@halk.com'),
(921, '2026-05-02T18:46:30.1338000+03:00', 7, N'fan922@halk.com'),
(922, '2026-05-02T18:46:30.1338002+03:00', 7, N'fan923@halk.com'),
(923, '2026-05-02T18:46:30.1338004+03:00', 7, N'fan924@halk.com'),
(924, '2026-05-02T18:46:30.1338006+03:00', 7, N'fan925@halk.com'),
(925, '2026-05-02T18:46:30.1338008+03:00', 7, N'fan926@halk.com'),
(926, '2026-05-02T18:46:30.1338010+03:00', 7, N'fan927@halk.com'),
(927, '2026-05-02T18:46:30.1338012+03:00', 7, N'fan928@halk.com'),
(928, '2026-05-02T18:46:30.1338015+03:00', 7, N'fan929@halk.com'),
(929, '2026-05-02T18:46:30.1338017+03:00', 7, N'fan930@halk.com'),
(930, '2026-05-02T18:46:30.1338019+03:00', 7, N'fan931@halk.com'),
(931, '2026-05-02T18:46:30.1338021+03:00', 7, N'fan932@halk.com'),
(932, '2026-05-02T18:46:30.1338023+03:00', 7, N'fan933@halk.com'),
(933, '2026-05-02T18:46:30.1338025+03:00', 7, N'fan934@halk.com'),
(934, '2026-05-02T18:46:30.1338027+03:00', 7, N'fan935@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (935, '2026-05-02T18:46:30.1338029+03:00', 7, N'fan936@halk.com'),
(936, '2026-05-02T18:46:30.1338031+03:00', 7, N'fan937@halk.com'),
(937, '2026-05-02T18:46:30.1338033+03:00', 7, N'fan938@halk.com'),
(938, '2026-05-02T18:46:30.1338035+03:00', 7, N'fan939@halk.com'),
(939, '2026-05-02T18:46:30.1338037+03:00', 7, N'fan940@halk.com'),
(940, '2026-05-02T18:46:30.1338039+03:00', 7, N'fan941@halk.com'),
(941, '2026-05-02T18:46:30.1338041+03:00', 7, N'fan942@halk.com'),
(942, '2026-05-02T18:46:30.1338043+03:00', 7, N'fan943@halk.com'),
(943, '2026-05-02T18:46:30.1338045+03:00', 7, N'fan944@halk.com'),
(944, '2026-05-02T18:46:30.1338047+03:00', 7, N'fan945@halk.com'),
(945, '2026-05-02T18:46:30.1338050+03:00', 7, N'fan946@halk.com'),
(946, '2026-05-02T18:46:30.1338052+03:00', 7, N'fan947@halk.com'),
(947, '2026-05-02T18:46:30.1338054+03:00', 7, N'fan948@halk.com'),
(948, '2026-05-02T18:46:30.1338056+03:00', 7, N'fan949@halk.com'),
(949, '2026-05-02T18:46:30.1338058+03:00', 7, N'fan950@halk.com'),
(950, '2026-05-02T18:46:30.1338060+03:00', 7, N'fan951@halk.com'),
(951, '2026-05-02T18:46:30.1338062+03:00', 7, N'fan952@halk.com'),
(952, '2026-05-02T18:46:30.1338064+03:00', 7, N'fan953@halk.com'),
(953, '2026-05-02T18:46:30.1338066+03:00', 7, N'fan954@halk.com'),
(954, '2026-05-02T18:46:30.1338068+03:00', 7, N'fan955@halk.com'),
(955, '2026-05-02T18:46:30.1338070+03:00', 7, N'fan956@halk.com'),
(956, '2026-05-02T18:46:30.1338072+03:00', 7, N'fan957@halk.com'),
(957, '2026-05-02T18:46:30.1338088+03:00', 8, N'fan958@halk.com'),
(958, '2026-05-02T18:46:30.1338093+03:00', 8, N'fan959@halk.com'),
(959, '2026-05-02T18:46:30.1338095+03:00', 8, N'fan960@halk.com'),
(960, '2026-05-02T18:46:30.1338097+03:00', 8, N'fan961@halk.com'),
(961, '2026-05-02T18:46:30.1338099+03:00', 8, N'fan962@halk.com'),
(962, '2026-05-02T18:46:30.1338101+03:00', 8, N'fan963@halk.com'),
(963, '2026-05-02T18:46:30.1338103+03:00', 8, N'fan964@halk.com'),
(964, '2026-05-02T18:46:30.1338105+03:00', 8, N'fan965@halk.com'),
(965, '2026-05-02T18:46:30.1338107+03:00', 8, N'fan966@halk.com'),
(966, '2026-05-02T18:46:30.1338109+03:00', 8, N'fan967@halk.com'),
(967, '2026-05-02T18:46:30.1338111+03:00', 8, N'fan968@halk.com'),
(968, '2026-05-02T18:46:30.1338113+03:00', 8, N'fan969@halk.com'),
(969, '2026-05-02T18:46:30.1338115+03:00', 8, N'fan970@halk.com'),
(970, '2026-05-02T18:46:30.1338117+03:00', 8, N'fan971@halk.com'),
(971, '2026-05-02T18:46:30.1338119+03:00', 8, N'fan972@halk.com'),
(972, '2026-05-02T18:46:30.1338121+03:00', 8, N'fan973@halk.com'),
(973, '2026-05-02T18:46:30.1338124+03:00', 8, N'fan974@halk.com'),
(974, '2026-05-02T18:46:30.1338126+03:00', 8, N'fan975@halk.com'),
(975, '2026-05-02T18:46:30.1338128+03:00', 8, N'fan976@halk.com'),
(976, '2026-05-02T18:46:30.1338130+03:00', 8, N'fan977@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (977, '2026-05-02T18:46:30.1338132+03:00', 8, N'fan978@halk.com'),
(978, '2026-05-02T18:46:30.1338134+03:00', 8, N'fan979@halk.com'),
(979, '2026-05-02T18:46:30.1338136+03:00', 8, N'fan980@halk.com'),
(980, '2026-05-02T18:46:30.1338138+03:00', 8, N'fan981@halk.com'),
(981, '2026-05-02T18:46:30.1338140+03:00', 8, N'fan982@halk.com'),
(982, '2026-05-02T18:46:30.1338142+03:00', 8, N'fan983@halk.com'),
(983, '2026-05-02T18:46:30.1338144+03:00', 8, N'fan984@halk.com'),
(984, '2026-05-02T18:46:30.1338146+03:00', 8, N'fan985@halk.com'),
(985, '2026-05-02T18:46:30.1338148+03:00', 8, N'fan986@halk.com'),
(986, '2026-05-02T18:46:30.1338150+03:00', 8, N'fan987@halk.com'),
(987, '2026-05-02T18:46:30.1338152+03:00', 8, N'fan988@halk.com'),
(988, '2026-05-02T18:46:30.1338154+03:00', 8, N'fan989@halk.com'),
(989, '2026-05-02T18:46:30.1338157+03:00', 8, N'fan990@halk.com'),
(990, '2026-05-02T18:46:30.1338159+03:00', 8, N'fan991@halk.com'),
(991, '2026-05-02T18:46:30.1338161+03:00', 8, N'fan992@halk.com'),
(992, '2026-05-02T18:46:30.1338163+03:00', 8, N'fan993@halk.com'),
(993, '2026-05-02T18:46:30.1338165+03:00', 8, N'fan994@halk.com'),
(994, '2026-05-02T18:46:30.1338167+03:00', 8, N'fan995@halk.com'),
(995, '2026-05-02T18:46:30.1338169+03:00', 8, N'fan996@halk.com'),
(996, '2026-05-02T18:46:30.1338171+03:00', 8, N'fan997@halk.com'),
(997, '2026-05-02T18:46:30.1338173+03:00', 8, N'fan998@halk.com'),
(998, '2026-05-02T18:46:30.1338175+03:00', 8, N'fan999@halk.com'),
(999, '2026-05-02T18:46:30.1338177+03:00', 8, N'fan1000@halk.com'),
(1000, '2026-05-02T18:46:30.1338180+03:00', 8, N'fan1001@halk.com'),
(1001, '2026-05-02T18:46:30.1338182+03:00', 8, N'fan1002@halk.com'),
(1002, '2026-05-02T18:46:30.1338184+03:00', 8, N'fan1003@halk.com'),
(1003, '2026-05-02T18:46:30.1338186+03:00', 8, N'fan1004@halk.com'),
(1004, '2026-05-02T18:46:30.1338188+03:00', 8, N'fan1005@halk.com'),
(1005, '2026-05-02T18:46:30.1338191+03:00', 8, N'fan1006@halk.com'),
(1006, '2026-05-02T18:46:30.1338193+03:00', 8, N'fan1007@halk.com'),
(1007, '2026-05-02T18:46:30.1338195+03:00', 8, N'fan1008@halk.com'),
(1008, '2026-05-02T18:46:30.1338197+03:00', 8, N'fan1009@halk.com'),
(1009, '2026-05-02T18:46:30.1338199+03:00', 8, N'fan1010@halk.com'),
(1010, '2026-05-02T18:46:30.1338201+03:00', 8, N'fan1011@halk.com'),
(1011, '2026-05-02T18:46:30.1338203+03:00', 8, N'fan1012@halk.com'),
(1012, '2026-05-02T18:46:30.1338205+03:00', 8, N'fan1013@halk.com'),
(1013, '2026-05-02T18:46:30.1338207+03:00', 8, N'fan1014@halk.com'),
(1014, '2026-05-02T18:46:30.1338209+03:00', 8, N'fan1015@halk.com'),
(1015, '2026-05-02T18:46:30.1338211+03:00', 8, N'fan1016@halk.com'),
(1016, '2026-05-02T18:46:30.1338213+03:00', 8, N'fan1017@halk.com'),
(1017, '2026-05-02T18:46:30.1338215+03:00', 8, N'fan1018@halk.com'),
(1018, '2026-05-02T18:46:30.1338217+03:00', 8, N'fan1019@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1019, '2026-05-02T18:46:30.1338219+03:00', 8, N'fan1020@halk.com'),
(1020, '2026-05-02T18:46:30.1338221+03:00', 8, N'fan1021@halk.com'),
(1021, '2026-05-02T18:46:30.1338224+03:00', 8, N'fan1022@halk.com'),
(1022, '2026-05-02T18:46:30.1338226+03:00', 8, N'fan1023@halk.com'),
(1023, '2026-05-02T18:46:30.1338228+03:00', 8, N'fan1024@halk.com'),
(1024, '2026-05-02T18:46:30.1338230+03:00', 8, N'fan1025@halk.com'),
(1025, '2026-05-02T18:46:30.1338232+03:00', 8, N'fan1026@halk.com'),
(1026, '2026-05-02T18:46:30.1338258+03:00', 8, N'fan1027@halk.com'),
(1027, '2026-05-02T18:46:30.1338260+03:00', 8, N'fan1028@halk.com'),
(1028, '2026-05-02T18:46:30.1338262+03:00', 8, N'fan1029@halk.com'),
(1029, '2026-05-02T18:46:30.1338265+03:00', 8, N'fan1030@halk.com'),
(1030, '2026-05-02T18:46:30.1338267+03:00', 8, N'fan1031@halk.com'),
(1031, '2026-05-02T18:46:30.1338269+03:00', 8, N'fan1032@halk.com'),
(1032, '2026-05-02T18:46:30.1338271+03:00', 8, N'fan1033@halk.com'),
(1033, '2026-05-02T18:46:30.1338273+03:00', 8, N'fan1034@halk.com'),
(1034, '2026-05-02T18:46:30.1338275+03:00', 8, N'fan1035@halk.com'),
(1035, '2026-05-02T18:46:30.1338277+03:00', 8, N'fan1036@halk.com'),
(1036, '2026-05-02T18:46:30.1338288+03:00', 8, N'fan1037@halk.com'),
(1037, '2026-05-02T18:46:30.1338291+03:00', 8, N'fan1038@halk.com'),
(1038, '2026-05-02T18:46:30.1338293+03:00', 8, N'fan1039@halk.com'),
(1039, '2026-05-02T18:46:30.1338295+03:00', 8, N'fan1040@halk.com'),
(1040, '2026-05-02T18:46:30.1338298+03:00', 8, N'fan1041@halk.com'),
(1041, '2026-05-02T18:46:30.1338299+03:00', 8, N'fan1042@halk.com'),
(1042, '2026-05-02T18:46:30.1338301+03:00', 8, N'fan1043@halk.com'),
(1043, '2026-05-02T18:46:30.1338304+03:00', 8, N'fan1044@halk.com'),
(1044, '2026-05-02T18:46:30.1338306+03:00', 8, N'fan1045@halk.com'),
(1045, '2026-05-02T18:46:30.1338308+03:00', 8, N'fan1046@halk.com'),
(1046, '2026-05-02T18:46:30.1338310+03:00', 8, N'fan1047@halk.com'),
(1047, '2026-05-02T18:46:30.1338312+03:00', 8, N'fan1048@halk.com'),
(1048, '2026-05-02T18:46:30.1338314+03:00', 8, N'fan1049@halk.com'),
(1049, '2026-05-02T18:46:30.1338317+03:00', 8, N'fan1050@halk.com'),
(1050, '2026-05-02T18:46:30.1338319+03:00', 8, N'fan1051@halk.com'),
(1051, '2026-05-02T18:46:30.1338321+03:00', 8, N'fan1052@halk.com'),
(1052, '2026-05-02T18:46:30.1338323+03:00', 8, N'fan1053@halk.com'),
(1053, '2026-05-02T18:46:30.1338325+03:00', 8, N'fan1054@halk.com'),
(1054, '2026-05-02T18:46:30.1338327+03:00', 8, N'fan1055@halk.com'),
(1055, '2026-05-02T18:46:30.1338329+03:00', 8, N'fan1056@halk.com'),
(1056, '2026-05-02T18:46:30.1338331+03:00', 8, N'fan1057@halk.com'),
(1057, '2026-05-02T18:46:30.1338333+03:00', 8, N'fan1058@halk.com'),
(1058, '2026-05-02T18:46:30.1338335+03:00', 8, N'fan1059@halk.com'),
(1059, '2026-05-02T18:46:30.1338337+03:00', 8, N'fan1060@halk.com'),
(1060, '2026-05-02T18:46:30.1338339+03:00', 8, N'fan1061@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1061, '2026-05-02T18:46:30.1338341+03:00', 8, N'fan1062@halk.com'),
(1062, '2026-05-02T18:46:30.1338344+03:00', 8, N'fan1063@halk.com'),
(1063, '2026-05-02T18:46:30.1338346+03:00', 8, N'fan1064@halk.com'),
(1064, '2026-05-02T18:46:30.1338348+03:00', 8, N'fan1065@halk.com'),
(1065, '2026-05-02T18:46:30.1338350+03:00', 8, N'fan1066@halk.com'),
(1066, '2026-05-02T18:46:30.1338352+03:00', 8, N'fan1067@halk.com'),
(1067, '2026-05-02T18:46:30.1338354+03:00', 8, N'fan1068@halk.com'),
(1068, '2026-05-02T18:46:30.1338356+03:00', 8, N'fan1069@halk.com'),
(1069, '2026-05-02T18:46:30.1338364+03:00', 9, N'fan1070@halk.com'),
(1070, '2026-05-02T18:46:30.1338366+03:00', 9, N'fan1071@halk.com'),
(1071, '2026-05-02T18:46:30.1338368+03:00', 9, N'fan1072@halk.com'),
(1072, '2026-05-02T18:46:30.1338370+03:00', 9, N'fan1073@halk.com'),
(1073, '2026-05-02T18:46:30.1338372+03:00', 9, N'fan1074@halk.com'),
(1074, '2026-05-02T18:46:30.1338374+03:00', 9, N'fan1075@halk.com'),
(1075, '2026-05-02T18:46:30.1338376+03:00', 9, N'fan1076@halk.com'),
(1076, '2026-05-02T18:46:30.1338378+03:00', 9, N'fan1077@halk.com'),
(1077, '2026-05-02T18:46:30.1338380+03:00', 9, N'fan1078@halk.com'),
(1078, '2026-05-02T18:46:30.1338382+03:00', 9, N'fan1079@halk.com'),
(1079, '2026-05-02T18:46:30.1338384+03:00', 9, N'fan1080@halk.com'),
(1080, '2026-05-02T18:46:30.1338386+03:00', 9, N'fan1081@halk.com'),
(1081, '2026-05-02T18:46:30.1338388+03:00', 9, N'fan1082@halk.com'),
(1082, '2026-05-02T18:46:30.1338390+03:00', 9, N'fan1083@halk.com'),
(1083, '2026-05-02T18:46:30.1338392+03:00', 9, N'fan1084@halk.com'),
(1084, '2026-05-02T18:46:30.1338394+03:00', 9, N'fan1085@halk.com'),
(1085, '2026-05-02T18:46:30.1338396+03:00', 9, N'fan1086@halk.com'),
(1086, '2026-05-02T18:46:30.1338399+03:00', 9, N'fan1087@halk.com'),
(1087, '2026-05-02T18:46:30.1338401+03:00', 9, N'fan1088@halk.com'),
(1088, '2026-05-02T18:46:30.1338403+03:00', 9, N'fan1089@halk.com'),
(1089, '2026-05-02T18:46:30.1338405+03:00', 9, N'fan1090@halk.com'),
(1090, '2026-05-02T18:46:30.1338407+03:00', 9, N'fan1091@halk.com'),
(1091, '2026-05-02T18:46:30.1338409+03:00', 9, N'fan1092@halk.com'),
(1092, '2026-05-02T18:46:30.1338411+03:00', 9, N'fan1093@halk.com'),
(1093, '2026-05-02T18:46:30.1338413+03:00', 9, N'fan1094@halk.com'),
(1094, '2026-05-02T18:46:30.1338415+03:00', 9, N'fan1095@halk.com'),
(1095, '2026-05-02T18:46:30.1338417+03:00', 9, N'fan1096@halk.com'),
(1096, '2026-05-02T18:46:30.1338419+03:00', 9, N'fan1097@halk.com'),
(1097, '2026-05-02T18:46:30.1338421+03:00', 9, N'fan1098@halk.com'),
(1098, '2026-05-02T18:46:30.1338423+03:00', 9, N'fan1099@halk.com'),
(1099, '2026-05-02T18:46:30.1338425+03:00', 9, N'fan1100@halk.com'),
(1100, '2026-05-02T18:46:30.1338427+03:00', 9, N'fan1101@halk.com'),
(1101, '2026-05-02T18:46:30.1338429+03:00', 9, N'fan1102@halk.com'),
(1102, '2026-05-02T18:46:30.1338432+03:00', 9, N'fan1103@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1103, '2026-05-02T18:46:30.1338434+03:00', 9, N'fan1104@halk.com'),
(1104, '2026-05-02T18:46:30.1338436+03:00', 9, N'fan1105@halk.com'),
(1105, '2026-05-02T18:46:30.1338438+03:00', 9, N'fan1106@halk.com'),
(1106, '2026-05-02T18:46:30.1338440+03:00', 9, N'fan1107@halk.com'),
(1107, '2026-05-02T18:46:30.1338442+03:00', 9, N'fan1108@halk.com'),
(1108, '2026-05-02T18:46:30.1338444+03:00', 9, N'fan1109@halk.com'),
(1109, '2026-05-02T18:46:30.1338446+03:00', 9, N'fan1110@halk.com'),
(1110, '2026-05-02T18:46:30.1338448+03:00', 9, N'fan1111@halk.com'),
(1111, '2026-05-02T18:46:30.1338450+03:00', 9, N'fan1112@halk.com'),
(1112, '2026-05-02T18:46:30.1338452+03:00', 9, N'fan1113@halk.com'),
(1113, '2026-05-02T18:46:30.1338465+03:00', 9, N'fan1114@halk.com'),
(1114, '2026-05-02T18:46:30.1338467+03:00', 9, N'fan1115@halk.com'),
(1115, '2026-05-02T18:46:30.1338469+03:00', 9, N'fan1116@halk.com'),
(1116, '2026-05-02T18:46:30.1338471+03:00', 9, N'fan1117@halk.com'),
(1117, '2026-05-02T18:46:30.1338473+03:00', 9, N'fan1118@halk.com'),
(1118, '2026-05-02T18:46:30.1338475+03:00', 9, N'fan1119@halk.com'),
(1119, '2026-05-02T18:46:30.1338478+03:00', 9, N'fan1120@halk.com'),
(1120, '2026-05-02T18:46:30.1338480+03:00', 9, N'fan1121@halk.com'),
(1121, '2026-05-02T18:46:30.1338482+03:00', 9, N'fan1122@halk.com'),
(1122, '2026-05-02T18:46:30.1338484+03:00', 9, N'fan1123@halk.com'),
(1123, '2026-05-02T18:46:30.1338486+03:00', 9, N'fan1124@halk.com'),
(1124, '2026-05-02T18:46:30.1338488+03:00', 9, N'fan1125@halk.com'),
(1125, '2026-05-02T18:46:30.1338491+03:00', 9, N'fan1126@halk.com'),
(1126, '2026-05-02T18:46:30.1338493+03:00', 9, N'fan1127@halk.com'),
(1127, '2026-05-02T18:46:30.1338495+03:00', 9, N'fan1128@halk.com'),
(1128, '2026-05-02T18:46:30.1338497+03:00', 9, N'fan1129@halk.com'),
(1129, '2026-05-02T18:46:30.1338499+03:00', 9, N'fan1130@halk.com'),
(1130, '2026-05-02T18:46:30.1338501+03:00', 9, N'fan1131@halk.com'),
(1131, '2026-05-02T18:46:30.1338503+03:00', 9, N'fan1132@halk.com'),
(1132, '2026-05-02T18:46:30.1338505+03:00', 9, N'fan1133@halk.com'),
(1133, '2026-05-02T18:46:30.1338507+03:00', 9, N'fan1134@halk.com'),
(1134, '2026-05-02T18:46:30.1338509+03:00', 9, N'fan1135@halk.com'),
(1135, '2026-05-02T18:46:30.1338511+03:00', 9, N'fan1136@halk.com'),
(1136, '2026-05-02T18:46:30.1338513+03:00', 9, N'fan1137@halk.com'),
(1137, '2026-05-02T18:46:30.1338515+03:00', 9, N'fan1138@halk.com'),
(1138, '2026-05-02T18:46:30.1338517+03:00', 9, N'fan1139@halk.com'),
(1139, '2026-05-02T18:46:30.1338519+03:00', 9, N'fan1140@halk.com'),
(1140, '2026-05-02T18:46:30.1338521+03:00', 9, N'fan1141@halk.com'),
(1141, '2026-05-02T18:46:30.1338523+03:00', 9, N'fan1142@halk.com'),
(1142, '2026-05-02T18:46:30.1338525+03:00', 9, N'fan1143@halk.com'),
(1143, '2026-05-02T18:46:30.1338528+03:00', 9, N'fan1144@halk.com'),
(1144, '2026-05-02T18:46:30.1338530+03:00', 9, N'fan1145@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1145, '2026-05-02T18:46:30.1338532+03:00', 9, N'fan1146@halk.com'),
(1146, '2026-05-02T18:46:30.1338534+03:00', 9, N'fan1147@halk.com'),
(1147, '2026-05-02T18:46:30.1338536+03:00', 9, N'fan1148@halk.com'),
(1148, '2026-05-02T18:46:30.1338538+03:00', 9, N'fan1149@halk.com'),
(1149, '2026-05-02T18:46:30.1338540+03:00', 9, N'fan1150@halk.com'),
(1150, '2026-05-02T18:46:30.1338542+03:00', 9, N'fan1151@halk.com'),
(1151, '2026-05-02T18:46:30.1338544+03:00', 9, N'fan1152@halk.com'),
(1152, '2026-05-02T18:46:30.1338546+03:00', 9, N'fan1153@halk.com'),
(1153, '2026-05-02T18:46:30.1338548+03:00', 9, N'fan1154@halk.com'),
(1154, '2026-05-02T18:46:30.1338550+03:00', 9, N'fan1155@halk.com'),
(1155, '2026-05-02T18:46:30.1338552+03:00', 9, N'fan1156@halk.com'),
(1156, '2026-05-02T18:46:30.1338554+03:00', 9, N'fan1157@halk.com'),
(1157, '2026-05-02T18:46:30.1338556+03:00', 9, N'fan1158@halk.com'),
(1158, '2026-05-02T18:46:30.1338558+03:00', 9, N'fan1159@halk.com'),
(1159, '2026-05-02T18:46:30.1338560+03:00', 9, N'fan1160@halk.com'),
(1160, '2026-05-02T18:46:30.1338563+03:00', 9, N'fan1161@halk.com'),
(1161, '2026-05-02T18:46:30.1338565+03:00', 9, N'fan1162@halk.com'),
(1162, '2026-05-02T18:46:30.1338567+03:00', 9, N'fan1163@halk.com'),
(1163, '2026-05-02T18:46:30.1338569+03:00', 9, N'fan1164@halk.com'),
(1164, '2026-05-02T18:46:30.1338571+03:00', 9, N'fan1165@halk.com'),
(1165, '2026-05-02T18:46:30.1338573+03:00', 9, N'fan1166@halk.com'),
(1166, '2026-05-02T18:46:30.1338575+03:00', 9, N'fan1167@halk.com'),
(1167, '2026-05-02T18:46:30.1338578+03:00', 9, N'fan1168@halk.com'),
(1168, '2026-05-02T18:46:30.1338580+03:00', 9, N'fan1169@halk.com'),
(1169, '2026-05-02T18:46:30.1338582+03:00', 9, N'fan1170@halk.com'),
(1170, '2026-05-02T18:46:30.1338584+03:00', 9, N'fan1171@halk.com'),
(1171, '2026-05-02T18:46:30.1338586+03:00', 9, N'fan1172@halk.com'),
(1172, '2026-05-02T18:46:30.1338588+03:00', 9, N'fan1173@halk.com'),
(1173, '2026-05-02T18:46:30.1338590+03:00', 9, N'fan1174@halk.com'),
(1174, '2026-05-02T18:46:30.1338592+03:00', 9, N'fan1175@halk.com'),
(1175, '2026-05-02T18:46:30.1338594+03:00', 9, N'fan1176@halk.com'),
(1176, '2026-05-02T18:46:30.1338597+03:00', 9, N'fan1177@halk.com'),
(1177, '2026-05-02T18:46:30.1338599+03:00', 9, N'fan1178@halk.com'),
(1178, '2026-05-02T18:46:30.1338601+03:00', 9, N'fan1179@halk.com'),
(1179, '2026-05-02T18:46:30.1338603+03:00', 9, N'fan1180@halk.com'),
(1180, '2026-05-02T18:46:30.1338605+03:00', 9, N'fan1181@halk.com'),
(1181, '2026-05-02T18:46:30.1338607+03:00', 9, N'fan1182@halk.com'),
(1182, '2026-05-02T18:46:30.1338609+03:00', 9, N'fan1183@halk.com'),
(1183, '2026-05-02T18:46:30.1338611+03:00', 9, N'fan1184@halk.com'),
(1184, '2026-05-02T18:46:30.1338613+03:00', 9, N'fan1185@halk.com'),
(1185, '2026-05-02T18:46:30.1338615+03:00', 9, N'fan1186@halk.com'),
(1186, '2026-05-02T18:46:30.1338617+03:00', 9, N'fan1187@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1187, '2026-05-02T18:46:30.1338619+03:00', 9, N'fan1188@halk.com'),
(1188, '2026-05-02T18:46:30.1338621+03:00', 9, N'fan1189@halk.com'),
(1189, '2026-05-02T18:46:30.1338623+03:00', 9, N'fan1190@halk.com'),
(1190, '2026-05-02T18:46:30.1338625+03:00', 9, N'fan1191@halk.com'),
(1191, '2026-05-02T18:46:30.1338634+03:00', 9, N'fan1192@halk.com'),
(1192, '2026-05-02T18:46:30.1338639+03:00', 9, N'fan1193@halk.com'),
(1193, '2026-05-02T18:46:30.1338642+03:00', 9, N'fan1194@halk.com'),
(1194, '2026-05-02T18:46:30.1338644+03:00', 9, N'fan1195@halk.com'),
(1195, '2026-05-02T18:46:30.1338646+03:00', 9, N'fan1196@halk.com'),
(1196, '2026-05-02T18:46:30.1338648+03:00', 9, N'fan1197@halk.com'),
(1197, '2026-05-02T18:46:30.1338650+03:00', 9, N'fan1198@halk.com'),
(1198, '2026-05-02T18:46:30.1338652+03:00', 9, N'fan1199@halk.com'),
(1199, '2026-05-02T18:46:30.1338654+03:00', 9, N'fan1200@halk.com'),
(1200, '2026-05-02T18:46:30.1338656+03:00', 9, N'fan1201@halk.com'),
(1201, '2026-05-02T18:46:30.1338658+03:00', 9, N'fan1202@halk.com'),
(1202, '2026-05-02T18:46:30.1338660+03:00', 9, N'fan1203@halk.com'),
(1203, '2026-05-02T18:46:30.1338662+03:00', 9, N'fan1204@halk.com'),
(1204, '2026-05-02T18:46:30.1338665+03:00', 9, N'fan1205@halk.com'),
(1205, '2026-05-02T18:46:30.1338667+03:00', 9, N'fan1206@halk.com'),
(1206, '2026-05-02T18:46:30.1338669+03:00', 9, N'fan1207@halk.com'),
(1207, '2026-05-02T18:46:30.1338671+03:00', 9, N'fan1208@halk.com'),
(1208, '2026-05-02T18:46:30.1338673+03:00', 9, N'fan1209@halk.com'),
(1209, '2026-05-02T18:46:30.1338676+03:00', 9, N'fan1210@halk.com'),
(1210, '2026-05-02T18:46:30.1338678+03:00', 9, N'fan1211@halk.com'),
(1211, '2026-05-02T18:46:30.1338680+03:00', 9, N'fan1212@halk.com'),
(1212, '2026-05-02T18:46:30.1338682+03:00', 9, N'fan1213@halk.com'),
(1213, '2026-05-02T18:46:30.1338684+03:00', 9, N'fan1214@halk.com'),
(1214, '2026-05-02T18:46:30.1338686+03:00', 9, N'fan1215@halk.com'),
(1215, '2026-05-02T18:46:30.1338688+03:00', 9, N'fan1216@halk.com'),
(1216, '2026-05-02T18:46:30.1338690+03:00', 9, N'fan1217@halk.com'),
(1217, '2026-05-02T18:46:30.1338692+03:00', 9, N'fan1218@halk.com'),
(1218, '2026-05-02T18:46:30.1338694+03:00', 9, N'fan1219@halk.com'),
(1219, '2026-05-02T18:46:30.1338696+03:00', 9, N'fan1220@halk.com'),
(1220, '2026-05-02T18:46:30.1338698+03:00', 9, N'fan1221@halk.com'),
(1221, '2026-05-02T18:46:30.1338700+03:00', 9, N'fan1222@halk.com'),
(1222, '2026-05-02T18:46:30.1338702+03:00', 9, N'fan1223@halk.com'),
(1223, '2026-05-02T18:46:30.1338704+03:00', 9, N'fan1224@halk.com'),
(1224, '2026-05-02T18:46:30.1338706+03:00', 9, N'fan1225@halk.com'),
(1225, '2026-05-02T18:46:30.1338709+03:00', 9, N'fan1226@halk.com'),
(1226, '2026-05-02T18:46:30.1338711+03:00', 9, N'fan1227@halk.com'),
(1227, '2026-05-02T18:46:30.1338713+03:00', 9, N'fan1228@halk.com'),
(1228, '2026-05-02T18:46:30.1338715+03:00', 9, N'fan1229@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1229, '2026-05-02T18:46:30.1338717+03:00', 9, N'fan1230@halk.com'),
(1230, '2026-05-02T18:46:30.1338719+03:00', 9, N'fan1231@halk.com'),
(1231, '2026-05-02T18:46:30.1338721+03:00', 9, N'fan1232@halk.com'),
(1232, '2026-05-02T18:46:30.1338723+03:00', 9, N'fan1233@halk.com'),
(1233, '2026-05-02T18:46:30.1338725+03:00', 9, N'fan1234@halk.com'),
(1234, '2026-05-02T18:46:30.1338727+03:00', 9, N'fan1235@halk.com'),
(1235, '2026-05-02T18:46:30.1338729+03:00', 9, N'fan1236@halk.com'),
(1236, '2026-05-02T18:46:30.1338732+03:00', 9, N'fan1237@halk.com'),
(1237, '2026-05-02T18:46:30.1338734+03:00', 9, N'fan1238@halk.com'),
(1238, '2026-05-02T18:46:30.1338736+03:00', 9, N'fan1239@halk.com'),
(1239, '2026-05-02T18:46:30.1338738+03:00', 9, N'fan1240@halk.com'),
(1240, '2026-05-02T18:46:30.1338740+03:00', 9, N'fan1241@halk.com'),
(1241, '2026-05-02T18:46:30.1338743+03:00', 9, N'fan1242@halk.com'),
(1242, '2026-05-02T18:46:30.1338745+03:00', 9, N'fan1243@halk.com'),
(1243, '2026-05-02T18:46:30.1338747+03:00', 9, N'fan1244@halk.com'),
(1244, '2026-05-02T18:46:30.1338749+03:00', 9, N'fan1245@halk.com'),
(1245, '2026-05-02T18:46:30.1338751+03:00', 9, N'fan1246@halk.com'),
(1246, '2026-05-02T18:46:30.1338753+03:00', 9, N'fan1247@halk.com'),
(1247, '2026-05-02T18:46:30.1338755+03:00', 9, N'fan1248@halk.com'),
(1248, '2026-05-02T18:46:30.1338757+03:00', 9, N'fan1249@halk.com'),
(1249, '2026-05-02T18:46:30.1338759+03:00', 9, N'fan1250@halk.com'),
(1250, '2026-05-02T18:46:30.1338761+03:00', 9, N'fan1251@halk.com'),
(1251, '2026-05-02T18:46:30.1338763+03:00', 9, N'fan1252@halk.com'),
(1252, '2026-05-02T18:46:30.1338765+03:00', 9, N'fan1253@halk.com'),
(1253, '2026-05-02T18:46:30.1338767+03:00', 9, N'fan1254@halk.com'),
(1254, '2026-05-02T18:46:30.1338769+03:00', 9, N'fan1255@halk.com'),
(1255, '2026-05-02T18:46:30.1338771+03:00', 9, N'fan1256@halk.com'),
(1256, '2026-05-02T18:46:30.1338773+03:00', 9, N'fan1257@halk.com'),
(1257, '2026-05-02T18:46:30.1338776+03:00', 9, N'fan1258@halk.com'),
(1258, '2026-05-02T18:46:30.1338778+03:00', 9, N'fan1259@halk.com'),
(1259, '2026-05-02T18:46:30.1338780+03:00', 9, N'fan1260@halk.com'),
(1260, '2026-05-02T18:46:30.1338782+03:00', 9, N'fan1261@halk.com'),
(1261, '2026-05-02T18:46:30.1338784+03:00', 9, N'fan1262@halk.com'),
(1262, '2026-05-02T18:46:30.1338786+03:00', 9, N'fan1263@halk.com'),
(1263, '2026-05-02T18:46:30.1338788+03:00', 9, N'fan1264@halk.com'),
(1264, '2026-05-02T18:46:30.1338790+03:00', 9, N'fan1265@halk.com'),
(1265, '2026-05-02T18:46:30.1338792+03:00', 9, N'fan1266@halk.com'),
(1266, '2026-05-02T18:46:30.1338794+03:00', 9, N'fan1267@halk.com'),
(1267, '2026-05-02T18:46:30.1338812+03:00', 10, N'fan1268@halk.com'),
(1268, '2026-05-02T18:46:30.1338814+03:00', 10, N'fan1269@halk.com'),
(1269, '2026-05-02T18:46:30.1338816+03:00', 10, N'fan1270@halk.com'),
(1270, '2026-05-02T18:46:30.1338818+03:00', 10, N'fan1271@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1271, '2026-05-02T18:46:30.1338820+03:00', 10, N'fan1272@halk.com'),
(1272, '2026-05-02T18:46:30.1338822+03:00', 10, N'fan1273@halk.com'),
(1273, '2026-05-02T18:46:30.1338824+03:00', 10, N'fan1274@halk.com'),
(1274, '2026-05-02T18:46:30.1338826+03:00', 10, N'fan1275@halk.com'),
(1275, '2026-05-02T18:46:30.1338828+03:00', 10, N'fan1276@halk.com'),
(1276, '2026-05-02T18:46:30.1338830+03:00', 10, N'fan1277@halk.com'),
(1277, '2026-05-02T18:46:30.1338833+03:00', 10, N'fan1278@halk.com'),
(1278, '2026-05-02T18:46:30.1338835+03:00', 10, N'fan1279@halk.com'),
(1279, '2026-05-02T18:46:30.1338837+03:00', 10, N'fan1280@halk.com'),
(1280, '2026-05-02T18:46:30.1338839+03:00', 10, N'fan1281@halk.com'),
(1281, '2026-05-02T18:46:30.1338840+03:00', 10, N'fan1282@halk.com'),
(1282, '2026-05-02T18:46:30.1338843+03:00', 10, N'fan1283@halk.com'),
(1283, '2026-05-02T18:46:30.1338845+03:00', 10, N'fan1284@halk.com'),
(1284, '2026-05-02T18:46:30.1338848+03:00', 10, N'fan1285@halk.com'),
(1285, '2026-05-02T18:46:30.1338850+03:00', 10, N'fan1286@halk.com'),
(1286, '2026-05-02T18:46:30.1338852+03:00', 10, N'fan1287@halk.com'),
(1287, '2026-05-02T18:46:30.1338854+03:00', 10, N'fan1288@halk.com'),
(1288, '2026-05-02T18:46:30.1338856+03:00', 10, N'fan1289@halk.com'),
(1289, '2026-05-02T18:46:30.1338858+03:00', 10, N'fan1290@halk.com'),
(1290, '2026-05-02T18:46:30.1338860+03:00', 10, N'fan1291@halk.com'),
(1291, '2026-05-02T18:46:30.1338862+03:00', 10, N'fan1292@halk.com'),
(1292, '2026-05-02T18:46:30.1338864+03:00', 10, N'fan1293@halk.com'),
(1293, '2026-05-02T18:46:30.1338866+03:00', 10, N'fan1294@halk.com'),
(1294, '2026-05-02T18:46:30.1338868+03:00', 10, N'fan1295@halk.com'),
(1295, '2026-05-02T18:46:30.1338870+03:00', 10, N'fan1296@halk.com'),
(1296, '2026-05-02T18:46:30.1338872+03:00', 10, N'fan1297@halk.com'),
(1297, '2026-05-02T18:46:30.1338874+03:00', 10, N'fan1298@halk.com'),
(1298, '2026-05-02T18:46:30.1338876+03:00', 10, N'fan1299@halk.com'),
(1299, '2026-05-02T18:46:30.1338878+03:00', 10, N'fan1300@halk.com'),
(1300, '2026-05-02T18:46:30.1338881+03:00', 10, N'fan1301@halk.com'),
(1301, '2026-05-02T18:46:30.1338883+03:00', 10, N'fan1302@halk.com'),
(1302, '2026-05-02T18:46:30.1338885+03:00', 10, N'fan1303@halk.com'),
(1303, '2026-05-02T18:46:30.1338887+03:00', 10, N'fan1304@halk.com'),
(1304, '2026-05-02T18:46:30.1338889+03:00', 10, N'fan1305@halk.com'),
(1305, '2026-05-02T18:46:30.1338891+03:00', 10, N'fan1306@halk.com'),
(1306, '2026-05-02T18:46:30.1338893+03:00', 10, N'fan1307@halk.com'),
(1307, '2026-05-02T18:46:30.1338895+03:00', 10, N'fan1308@halk.com'),
(1308, '2026-05-02T18:46:30.1338897+03:00', 10, N'fan1309@halk.com'),
(1309, '2026-05-02T18:46:30.1338899+03:00', 10, N'fan1310@halk.com'),
(1310, '2026-05-02T18:46:30.1338901+03:00', 10, N'fan1311@halk.com'),
(1311, '2026-05-02T18:46:30.1338903+03:00', 10, N'fan1312@halk.com'),
(1312, '2026-05-02T18:46:30.1338905+03:00', 10, N'fan1313@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1313, '2026-05-02T18:46:30.1338907+03:00', 10, N'fan1314@halk.com'),
(1314, '2026-05-02T18:46:30.1338909+03:00', 10, N'fan1315@halk.com'),
(1315, '2026-05-02T18:46:30.1338911+03:00', 10, N'fan1316@halk.com'),
(1316, '2026-05-02T18:46:30.1338914+03:00', 10, N'fan1317@halk.com'),
(1317, '2026-05-02T18:46:30.1338916+03:00', 10, N'fan1318@halk.com'),
(1318, '2026-05-02T18:46:30.1338918+03:00', 10, N'fan1319@halk.com'),
(1319, '2026-05-02T18:46:30.1338920+03:00', 10, N'fan1320@halk.com'),
(1320, '2026-05-02T18:46:30.1338922+03:00', 10, N'fan1321@halk.com'),
(1321, '2026-05-02T18:46:30.1338924+03:00', 10, N'fan1322@halk.com'),
(1322, '2026-05-02T18:46:30.1338926+03:00', 10, N'fan1323@halk.com'),
(1323, '2026-05-02T18:46:30.1338929+03:00', 10, N'fan1324@halk.com'),
(1324, '2026-05-02T18:46:30.1338931+03:00', 10, N'fan1325@halk.com'),
(1325, '2026-05-02T18:46:30.1338933+03:00', 10, N'fan1326@halk.com'),
(1326, '2026-05-02T18:46:30.1338935+03:00', 10, N'fan1327@halk.com'),
(1327, '2026-05-02T18:46:30.1338937+03:00', 10, N'fan1328@halk.com'),
(1328, '2026-05-02T18:46:30.1338939+03:00', 10, N'fan1329@halk.com'),
(1329, '2026-05-02T18:46:30.1338941+03:00', 10, N'fan1330@halk.com'),
(1330, '2026-05-02T18:46:30.1338943+03:00', 10, N'fan1331@halk.com'),
(1331, '2026-05-02T18:46:30.1338945+03:00', 10, N'fan1332@halk.com'),
(1332, '2026-05-02T18:46:30.1338947+03:00', 10, N'fan1333@halk.com'),
(1333, '2026-05-02T18:46:30.1338949+03:00', 10, N'fan1334@halk.com'),
(1334, '2026-05-02T18:46:30.1338952+03:00', 10, N'fan1335@halk.com'),
(1335, '2026-05-02T18:46:30.1338953+03:00', 10, N'fan1336@halk.com'),
(1336, '2026-05-02T18:46:30.1338956+03:00', 10, N'fan1337@halk.com'),
(1337, '2026-05-02T18:46:30.1338958+03:00', 10, N'fan1338@halk.com'),
(1338, '2026-05-02T18:46:30.1338959+03:00', 10, N'fan1339@halk.com'),
(1339, '2026-05-02T18:46:30.1338962+03:00', 10, N'fan1340@halk.com'),
(1340, '2026-05-02T18:46:30.1338964+03:00', 10, N'fan1341@halk.com'),
(1341, '2026-05-02T18:46:30.1338966+03:00', 10, N'fan1342@halk.com'),
(1342, '2026-05-02T18:46:30.1338968+03:00', 10, N'fan1343@halk.com'),
(1343, '2026-05-02T18:46:30.1338969+03:00', 10, N'fan1344@halk.com'),
(1344, '2026-05-02T18:46:30.1338981+03:00', 10, N'fan1345@halk.com'),
(1345, '2026-05-02T18:46:30.1338987+03:00', 10, N'fan1346@halk.com'),
(1346, '2026-05-02T18:46:30.1338989+03:00', 10, N'fan1347@halk.com'),
(1347, '2026-05-02T18:46:30.1338991+03:00', 10, N'fan1348@halk.com'),
(1348, '2026-05-02T18:46:30.1338993+03:00', 10, N'fan1349@halk.com'),
(1349, '2026-05-02T18:46:30.1338995+03:00', 10, N'fan1350@halk.com'),
(1350, '2026-05-02T18:46:30.1338997+03:00', 10, N'fan1351@halk.com'),
(1351, '2026-05-02T18:46:30.1338999+03:00', 10, N'fan1352@halk.com'),
(1352, '2026-05-02T18:46:30.1339001+03:00', 10, N'fan1353@halk.com'),
(1353, '2026-05-02T18:46:30.1339003+03:00', 10, N'fan1354@halk.com'),
(1354, '2026-05-02T18:46:30.1339005+03:00', 10, N'fan1355@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1355, '2026-05-02T18:46:30.1339007+03:00', 10, N'fan1356@halk.com'),
(1356, '2026-05-02T18:46:30.1339009+03:00', 10, N'fan1357@halk.com'),
(1357, '2026-05-02T18:46:30.1339011+03:00', 10, N'fan1358@halk.com'),
(1358, '2026-05-02T18:46:30.1339013+03:00', 10, N'fan1359@halk.com'),
(1359, '2026-05-02T18:46:30.1339015+03:00', 10, N'fan1360@halk.com'),
(1360, '2026-05-02T18:46:30.1339017+03:00', 10, N'fan1361@halk.com'),
(1361, '2026-05-02T18:46:30.1339019+03:00', 10, N'fan1362@halk.com'),
(1362, '2026-05-02T18:46:30.1339022+03:00', 10, N'fan1363@halk.com'),
(1363, '2026-05-02T18:46:30.1339024+03:00', 10, N'fan1364@halk.com'),
(1364, '2026-05-02T18:46:30.1339026+03:00', 10, N'fan1365@halk.com'),
(1365, '2026-05-02T18:46:30.1339028+03:00', 10, N'fan1366@halk.com'),
(1366, '2026-05-02T18:46:30.1339030+03:00', 10, N'fan1367@halk.com'),
(1367, '2026-05-02T18:46:30.1339032+03:00', 10, N'fan1368@halk.com'),
(1368, '2026-05-02T18:46:30.1339034+03:00', 10, N'fan1369@halk.com'),
(1369, '2026-05-02T18:46:30.1339036+03:00', 10, N'fan1370@halk.com'),
(1370, '2026-05-02T18:46:30.1339038+03:00', 10, N'fan1371@halk.com'),
(1371, '2026-05-02T18:46:30.1339040+03:00', 10, N'fan1372@halk.com'),
(1372, '2026-05-02T18:46:30.1339042+03:00', 10, N'fan1373@halk.com'),
(1373, '2026-05-02T18:46:30.1339044+03:00', 10, N'fan1374@halk.com'),
(1374, '2026-05-02T18:46:30.1339046+03:00', 10, N'fan1375@halk.com'),
(1375, '2026-05-02T18:46:30.1339048+03:00', 10, N'fan1376@halk.com'),
(1376, '2026-05-02T18:46:30.1339050+03:00', 10, N'fan1377@halk.com'),
(1377, '2026-05-02T18:46:30.1339052+03:00', 10, N'fan1378@halk.com'),
(1378, '2026-05-02T18:46:30.1339054+03:00', 10, N'fan1379@halk.com'),
(1379, '2026-05-02T18:46:30.1339063+03:00', 11, N'fan1380@halk.com'),
(1380, '2026-05-02T18:46:30.1339065+03:00', 11, N'fan1381@halk.com'),
(1381, '2026-05-02T18:46:30.1339067+03:00', 11, N'fan1382@halk.com'),
(1382, '2026-05-02T18:46:30.1339069+03:00', 11, N'fan1383@halk.com'),
(1383, '2026-05-02T18:46:30.1339071+03:00', 11, N'fan1384@halk.com'),
(1384, '2026-05-02T18:46:30.1339073+03:00', 11, N'fan1385@halk.com'),
(1385, '2026-05-02T18:46:30.1339075+03:00', 11, N'fan1386@halk.com'),
(1386, '2026-05-02T18:46:30.1339077+03:00', 11, N'fan1387@halk.com'),
(1387, '2026-05-02T18:46:30.1339079+03:00', 11, N'fan1388@halk.com'),
(1388, '2026-05-02T18:46:30.1339081+03:00', 11, N'fan1389@halk.com'),
(1389, '2026-05-02T18:46:30.1339083+03:00', 11, N'fan1390@halk.com'),
(1390, '2026-05-02T18:46:30.1339085+03:00', 11, N'fan1391@halk.com'),
(1391, '2026-05-02T18:46:30.1339087+03:00', 11, N'fan1392@halk.com'),
(1392, '2026-05-02T18:46:30.1339089+03:00', 11, N'fan1393@halk.com'),
(1393, '2026-05-02T18:46:30.1339091+03:00', 11, N'fan1394@halk.com'),
(1394, '2026-05-02T18:46:30.1339093+03:00', 11, N'fan1395@halk.com'),
(1395, '2026-05-02T18:46:30.1339095+03:00', 11, N'fan1396@halk.com'),
(1396, '2026-05-02T18:46:30.1339097+03:00', 11, N'fan1397@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1397, '2026-05-02T18:46:30.1339099+03:00', 11, N'fan1398@halk.com'),
(1398, '2026-05-02T18:46:30.1339101+03:00', 11, N'fan1399@halk.com'),
(1399, '2026-05-02T18:46:30.1339103+03:00', 11, N'fan1400@halk.com'),
(1400, '2026-05-02T18:46:30.1339105+03:00', 11, N'fan1401@halk.com'),
(1401, '2026-05-02T18:46:30.1339107+03:00', 11, N'fan1402@halk.com'),
(1402, '2026-05-02T18:46:30.1339109+03:00', 11, N'fan1403@halk.com'),
(1403, '2026-05-02T18:46:30.1339112+03:00', 11, N'fan1404@halk.com'),
(1404, '2026-05-02T18:46:30.1339114+03:00', 11, N'fan1405@halk.com'),
(1405, '2026-05-02T18:46:30.1339116+03:00', 11, N'fan1406@halk.com'),
(1406, '2026-05-02T18:46:30.1339118+03:00', 11, N'fan1407@halk.com'),
(1407, '2026-05-02T18:46:30.1339120+03:00', 11, N'fan1408@halk.com'),
(1408, '2026-05-02T18:46:30.1339122+03:00', 11, N'fan1409@halk.com'),
(1409, '2026-05-02T18:46:30.1339124+03:00', 11, N'fan1410@halk.com'),
(1410, '2026-05-02T18:46:30.1339126+03:00', 11, N'fan1411@halk.com'),
(1411, '2026-05-02T18:46:30.1339128+03:00', 11, N'fan1412@halk.com'),
(1412, '2026-05-02T18:46:30.1339130+03:00', 11, N'fan1413@halk.com'),
(1413, '2026-05-02T18:46:30.1339132+03:00', 11, N'fan1414@halk.com'),
(1414, '2026-05-02T18:46:30.1339134+03:00', 11, N'fan1415@halk.com'),
(1415, '2026-05-02T18:46:30.1339136+03:00', 11, N'fan1416@halk.com'),
(1416, '2026-05-02T18:46:30.1339138+03:00', 11, N'fan1417@halk.com'),
(1417, '2026-05-02T18:46:30.1339140+03:00', 11, N'fan1418@halk.com'),
(1418, '2026-05-02T18:46:30.1339142+03:00', 11, N'fan1419@halk.com'),
(1419, '2026-05-02T18:46:30.1339145+03:00', 11, N'fan1420@halk.com'),
(1420, '2026-05-02T18:46:30.1339147+03:00', 11, N'fan1421@halk.com'),
(1421, '2026-05-02T18:46:30.1339160+03:00', 11, N'fan1422@halk.com'),
(1422, '2026-05-02T18:46:30.1339163+03:00', 11, N'fan1423@halk.com'),
(1423, '2026-05-02T18:46:30.1339165+03:00', 11, N'fan1424@halk.com'),
(1424, '2026-05-02T18:46:30.1339167+03:00', 11, N'fan1425@halk.com'),
(1425, '2026-05-02T18:46:30.1339169+03:00', 11, N'fan1426@halk.com'),
(1426, '2026-05-02T18:46:30.1339171+03:00', 11, N'fan1427@halk.com'),
(1427, '2026-05-02T18:46:30.1339173+03:00', 11, N'fan1428@halk.com'),
(1428, '2026-05-02T18:46:30.1339175+03:00', 11, N'fan1429@halk.com'),
(1429, '2026-05-02T18:46:30.1339177+03:00', 11, N'fan1430@halk.com'),
(1430, '2026-05-02T18:46:30.1339179+03:00', 11, N'fan1431@halk.com'),
(1431, '2026-05-02T18:46:30.1339181+03:00', 11, N'fan1432@halk.com'),
(1432, '2026-05-02T18:46:30.1339184+03:00', 11, N'fan1433@halk.com'),
(1433, '2026-05-02T18:46:30.1339186+03:00', 11, N'fan1434@halk.com'),
(1434, '2026-05-02T18:46:30.1339188+03:00', 11, N'fan1435@halk.com'),
(1435, '2026-05-02T18:46:30.1339190+03:00', 11, N'fan1436@halk.com'),
(1436, '2026-05-02T18:46:30.1339192+03:00', 11, N'fan1437@halk.com'),
(1437, '2026-05-02T18:46:30.1339194+03:00', 11, N'fan1438@halk.com'),
(1438, '2026-05-02T18:46:30.1339196+03:00', 11, N'fan1439@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1439, '2026-05-02T18:46:30.1339198+03:00', 11, N'fan1440@halk.com'),
(1440, '2026-05-02T18:46:30.1339200+03:00', 11, N'fan1441@halk.com'),
(1441, '2026-05-02T18:46:30.1339203+03:00', 11, N'fan1442@halk.com'),
(1442, '2026-05-02T18:46:30.1339205+03:00', 11, N'fan1443@halk.com'),
(1443, '2026-05-02T18:46:30.1339207+03:00', 11, N'fan1444@halk.com'),
(1444, '2026-05-02T18:46:30.1339209+03:00', 11, N'fan1445@halk.com'),
(1445, '2026-05-02T18:46:30.1339210+03:00', 11, N'fan1446@halk.com'),
(1446, '2026-05-02T18:46:30.1339212+03:00', 11, N'fan1447@halk.com'),
(1447, '2026-05-02T18:46:30.1339214+03:00', 11, N'fan1448@halk.com'),
(1448, '2026-05-02T18:46:30.1339216+03:00', 11, N'fan1449@halk.com'),
(1449, '2026-05-02T18:46:30.1339218+03:00', 11, N'fan1450@halk.com'),
(1450, '2026-05-02T18:46:30.1339221+03:00', 11, N'fan1451@halk.com'),
(1451, '2026-05-02T18:46:30.1339223+03:00', 11, N'fan1452@halk.com'),
(1452, '2026-05-02T18:46:30.1339225+03:00', 11, N'fan1453@halk.com'),
(1453, '2026-05-02T18:46:30.1339227+03:00', 11, N'fan1454@halk.com'),
(1454, '2026-05-02T18:46:30.1339229+03:00', 11, N'fan1455@halk.com'),
(1455, '2026-05-02T18:46:30.1339231+03:00', 11, N'fan1456@halk.com'),
(1456, '2026-05-02T18:46:30.1339233+03:00', 11, N'fan1457@halk.com'),
(1457, '2026-05-02T18:46:30.1339235+03:00', 11, N'fan1458@halk.com'),
(1458, '2026-05-02T18:46:30.1339237+03:00', 11, N'fan1459@halk.com'),
(1459, '2026-05-02T18:46:30.1339239+03:00', 11, N'fan1460@halk.com'),
(1460, '2026-05-02T18:46:30.1339241+03:00', 11, N'fan1461@halk.com'),
(1461, '2026-05-02T18:46:30.1339243+03:00', 11, N'fan1462@halk.com'),
(1462, '2026-05-02T18:46:30.1339245+03:00', 11, N'fan1463@halk.com'),
(1463, '2026-05-02T18:46:30.1339247+03:00', 11, N'fan1464@halk.com'),
(1464, '2026-05-02T18:46:30.1339249+03:00', 11, N'fan1465@halk.com'),
(1465, '2026-05-02T18:46:30.1339251+03:00', 11, N'fan1466@halk.com'),
(1466, '2026-05-02T18:46:30.1339253+03:00', 11, N'fan1467@halk.com'),
(1467, '2026-05-02T18:46:30.1339255+03:00', 11, N'fan1468@halk.com'),
(1468, '2026-05-02T18:46:30.1339257+03:00', 11, N'fan1469@halk.com'),
(1469, '2026-05-02T18:46:30.1339259+03:00', 11, N'fan1470@halk.com'),
(1470, '2026-05-02T18:46:30.1339261+03:00', 11, N'fan1471@halk.com'),
(1471, '2026-05-02T18:46:30.1339263+03:00', 11, N'fan1472@halk.com'),
(1472, '2026-05-02T18:46:30.1339265+03:00', 11, N'fan1473@halk.com'),
(1473, '2026-05-02T18:46:30.1339267+03:00', 11, N'fan1474@halk.com'),
(1474, '2026-05-02T18:46:30.1339269+03:00', 11, N'fan1475@halk.com'),
(1475, '2026-05-02T18:46:30.1339272+03:00', 11, N'fan1476@halk.com'),
(1476, '2026-05-02T18:46:30.1339274+03:00', 11, N'fan1477@halk.com'),
(1477, '2026-05-02T18:46:30.1339276+03:00', 11, N'fan1478@halk.com'),
(1478, '2026-05-02T18:46:30.1339278+03:00', 11, N'fan1479@halk.com'),
(1479, '2026-05-02T18:46:30.1339280+03:00', 11, N'fan1480@halk.com'),
(1480, '2026-05-02T18:46:30.1339282+03:00', 11, N'fan1481@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1481, '2026-05-02T18:46:30.1339284+03:00', 11, N'fan1482@halk.com'),
(1482, '2026-05-02T18:46:30.1339286+03:00', 11, N'fan1483@halk.com'),
(1483, '2026-05-02T18:46:30.1339288+03:00', 11, N'fan1484@halk.com'),
(1484, '2026-05-02T18:46:30.1339290+03:00', 11, N'fan1485@halk.com'),
(1485, '2026-05-02T18:46:30.1339292+03:00', 11, N'fan1486@halk.com'),
(1486, '2026-05-02T18:46:30.1339294+03:00', 11, N'fan1487@halk.com'),
(1487, '2026-05-02T18:46:30.1339296+03:00', 11, N'fan1488@halk.com'),
(1488, '2026-05-02T18:46:30.1339298+03:00', 11, N'fan1489@halk.com'),
(1489, '2026-05-02T18:46:30.1339300+03:00', 11, N'fan1490@halk.com'),
(1490, '2026-05-02T18:46:30.1339302+03:00', 11, N'fan1491@halk.com'),
(1491, '2026-05-02T18:46:30.1339310+03:00', 12, N'fan1492@halk.com'),
(1492, '2026-05-02T18:46:30.1339312+03:00', 12, N'fan1493@halk.com'),
(1493, '2026-05-02T18:46:30.1339314+03:00', 12, N'fan1494@halk.com'),
(1494, '2026-05-02T18:46:30.1339316+03:00', 12, N'fan1495@halk.com'),
(1495, '2026-05-02T18:46:30.1339318+03:00', 12, N'fan1496@halk.com'),
(1496, '2026-05-02T18:46:30.1339320+03:00', 12, N'fan1497@halk.com'),
(1497, '2026-05-02T18:46:30.1339322+03:00', 12, N'fan1498@halk.com'),
(1498, '2026-05-02T18:46:30.1339335+03:00', 12, N'fan1499@halk.com'),
(1499, '2026-05-02T18:46:30.1339337+03:00', 12, N'fan1500@halk.com'),
(1500, '2026-05-02T18:46:30.1339340+03:00', 12, N'fan1501@halk.com'),
(1501, '2026-05-02T18:46:30.1339342+03:00', 12, N'fan1502@halk.com'),
(1502, '2026-05-02T18:46:30.1339344+03:00', 12, N'fan1503@halk.com'),
(1503, '2026-05-02T18:46:30.1339346+03:00', 12, N'fan1504@halk.com'),
(1504, '2026-05-02T18:46:30.1339348+03:00', 12, N'fan1505@halk.com'),
(1505, '2026-05-02T18:46:30.1339350+03:00', 12, N'fan1506@halk.com'),
(1506, '2026-05-02T18:46:30.1339352+03:00', 12, N'fan1507@halk.com'),
(1507, '2026-05-02T18:46:30.1339354+03:00', 12, N'fan1508@halk.com'),
(1508, '2026-05-02T18:46:30.1339356+03:00', 12, N'fan1509@halk.com'),
(1509, '2026-05-02T18:46:30.1339359+03:00', 12, N'fan1510@halk.com'),
(1510, '2026-05-02T18:46:30.1339361+03:00', 12, N'fan1511@halk.com'),
(1511, '2026-05-02T18:46:30.1339363+03:00', 12, N'fan1512@halk.com'),
(1512, '2026-05-02T18:46:30.1339365+03:00', 12, N'fan1513@halk.com'),
(1513, '2026-05-02T18:46:30.1339367+03:00', 12, N'fan1514@halk.com'),
(1514, '2026-05-02T18:46:30.1339369+03:00', 12, N'fan1515@halk.com'),
(1515, '2026-05-02T18:46:30.1339371+03:00', 12, N'fan1516@halk.com'),
(1516, '2026-05-02T18:46:30.1339373+03:00', 12, N'fan1517@halk.com'),
(1517, '2026-05-02T18:46:30.1339375+03:00', 12, N'fan1518@halk.com'),
(1518, '2026-05-02T18:46:30.1339377+03:00', 12, N'fan1519@halk.com'),
(1519, '2026-05-02T18:46:30.1339379+03:00', 12, N'fan1520@halk.com'),
(1520, '2026-05-02T18:46:30.1339381+03:00', 12, N'fan1521@halk.com'),
(1521, '2026-05-02T18:46:30.1339383+03:00', 12, N'fan1522@halk.com'),
(1522, '2026-05-02T18:46:30.1339385+03:00', 12, N'fan1523@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1523, '2026-05-02T18:46:30.1339387+03:00', 12, N'fan1524@halk.com'),
(1524, '2026-05-02T18:46:30.1339390+03:00', 12, N'fan1525@halk.com'),
(1525, '2026-05-02T18:46:30.1339392+03:00', 12, N'fan1526@halk.com'),
(1526, '2026-05-02T18:46:30.1339394+03:00', 12, N'fan1527@halk.com'),
(1527, '2026-05-02T18:46:30.1339396+03:00', 12, N'fan1528@halk.com'),
(1528, '2026-05-02T18:46:30.1339398+03:00', 12, N'fan1529@halk.com'),
(1529, '2026-05-02T18:46:30.1339400+03:00', 12, N'fan1530@halk.com'),
(1530, '2026-05-02T18:46:30.1339402+03:00', 12, N'fan1531@halk.com'),
(1531, '2026-05-02T18:46:30.1339404+03:00', 12, N'fan1532@halk.com'),
(1532, '2026-05-02T18:46:30.1339406+03:00', 12, N'fan1533@halk.com'),
(1533, '2026-05-02T18:46:30.1339408+03:00', 12, N'fan1534@halk.com'),
(1534, '2026-05-02T18:46:30.1339410+03:00', 12, N'fan1535@halk.com'),
(1535, '2026-05-02T18:46:30.1339412+03:00', 12, N'fan1536@halk.com'),
(1536, '2026-05-02T18:46:30.1339414+03:00', 12, N'fan1537@halk.com'),
(1537, '2026-05-02T18:46:30.1339416+03:00', 12, N'fan1538@halk.com'),
(1538, '2026-05-02T18:46:30.1339418+03:00', 12, N'fan1539@halk.com'),
(1539, '2026-05-02T18:46:30.1339420+03:00', 12, N'fan1540@halk.com'),
(1540, '2026-05-02T18:46:30.1339423+03:00', 12, N'fan1541@halk.com'),
(1541, '2026-05-02T18:46:30.1339425+03:00', 12, N'fan1542@halk.com'),
(1542, '2026-05-02T18:46:30.1339427+03:00', 12, N'fan1543@halk.com'),
(1543, '2026-05-02T18:46:30.1339429+03:00', 12, N'fan1544@halk.com'),
(1544, '2026-05-02T18:46:30.1339431+03:00', 12, N'fan1545@halk.com'),
(1545, '2026-05-02T18:46:30.1339433+03:00', 12, N'fan1546@halk.com'),
(1546, '2026-05-02T18:46:30.1339436+03:00', 12, N'fan1547@halk.com'),
(1547, '2026-05-02T18:46:30.1339438+03:00', 12, N'fan1548@halk.com'),
(1548, '2026-05-02T18:46:30.1339440+03:00', 12, N'fan1549@halk.com'),
(1549, '2026-05-02T18:46:30.1339442+03:00', 12, N'fan1550@halk.com'),
(1550, '2026-05-02T18:46:30.1339444+03:00', 12, N'fan1551@halk.com'),
(1551, '2026-05-02T18:46:30.1339446+03:00', 12, N'fan1552@halk.com'),
(1552, '2026-05-02T18:46:30.1339448+03:00', 12, N'fan1553@halk.com'),
(1553, '2026-05-02T18:46:30.1339450+03:00', 12, N'fan1554@halk.com'),
(1554, '2026-05-02T18:46:30.1339452+03:00', 12, N'fan1555@halk.com'),
(1555, '2026-05-02T18:46:30.1339454+03:00', 12, N'fan1556@halk.com'),
(1556, '2026-05-02T18:46:30.1339456+03:00', 12, N'fan1557@halk.com'),
(1557, '2026-05-02T18:46:30.1339458+03:00', 12, N'fan1558@halk.com'),
(1558, '2026-05-02T18:46:30.1339460+03:00', 12, N'fan1559@halk.com'),
(1559, '2026-05-02T18:46:30.1339462+03:00', 12, N'fan1560@halk.com'),
(1560, '2026-05-02T18:46:30.1339464+03:00', 12, N'fan1561@halk.com'),
(1561, '2026-05-02T18:46:30.1339466+03:00', 12, N'fan1562@halk.com'),
(1562, '2026-05-02T18:46:30.1339468+03:00', 12, N'fan1563@halk.com'),
(1563, '2026-05-02T18:46:30.1339470+03:00', 12, N'fan1564@halk.com'),
(1564, '2026-05-02T18:46:30.1339472+03:00', 12, N'fan1565@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1565, '2026-05-02T18:46:30.1339474+03:00', 12, N'fan1566@halk.com'),
(1566, '2026-05-02T18:46:30.1339476+03:00', 12, N'fan1567@halk.com'),
(1567, '2026-05-02T18:46:30.1339478+03:00', 12, N'fan1568@halk.com'),
(1568, '2026-05-02T18:46:30.1339480+03:00', 12, N'fan1569@halk.com'),
(1569, '2026-05-02T18:46:30.1339483+03:00', 12, N'fan1570@halk.com'),
(1570, '2026-05-02T18:46:30.1339485+03:00', 12, N'fan1571@halk.com'),
(1571, '2026-05-02T18:46:30.1339487+03:00', 12, N'fan1572@halk.com'),
(1572, '2026-05-02T18:46:30.1339489+03:00', 12, N'fan1573@halk.com'),
(1573, '2026-05-02T18:46:30.1339491+03:00', 12, N'fan1574@halk.com'),
(1574, '2026-05-02T18:46:30.1339493+03:00', 12, N'fan1575@halk.com'),
(1575, '2026-05-02T18:46:30.1339495+03:00', 12, N'fan1576@halk.com'),
(1576, '2026-05-02T18:46:30.1339497+03:00', 12, N'fan1577@halk.com'),
(1577, '2026-05-02T18:46:30.1339509+03:00', 12, N'fan1578@halk.com'),
(1578, '2026-05-02T18:46:30.1339512+03:00', 12, N'fan1579@halk.com'),
(1579, '2026-05-02T18:46:30.1339514+03:00', 12, N'fan1580@halk.com'),
(1580, '2026-05-02T18:46:30.1339516+03:00', 12, N'fan1581@halk.com'),
(1581, '2026-05-02T18:46:30.1339518+03:00', 12, N'fan1582@halk.com'),
(1582, '2026-05-02T18:46:30.1339520+03:00', 12, N'fan1583@halk.com'),
(1583, '2026-05-02T18:46:30.1339522+03:00', 12, N'fan1584@halk.com'),
(1584, '2026-05-02T18:46:30.1339524+03:00', 12, N'fan1585@halk.com'),
(1585, '2026-05-02T18:46:30.1339526+03:00', 12, N'fan1586@halk.com'),
(1586, '2026-05-02T18:46:30.1339528+03:00', 12, N'fan1587@halk.com'),
(1587, '2026-05-02T18:46:30.1339530+03:00', 12, N'fan1588@halk.com'),
(1588, '2026-05-02T18:46:30.1339532+03:00', 12, N'fan1589@halk.com'),
(1589, '2026-05-02T18:46:30.1339534+03:00', 12, N'fan1590@halk.com'),
(1590, '2026-05-02T18:46:30.1339536+03:00', 12, N'fan1591@halk.com'),
(1591, '2026-05-02T18:46:30.1339538+03:00', 12, N'fan1592@halk.com'),
(1592, '2026-05-02T18:46:30.1339540+03:00', 12, N'fan1593@halk.com'),
(1593, '2026-05-02T18:46:30.1339542+03:00', 12, N'fan1594@halk.com'),
(1594, '2026-05-02T18:46:30.1339545+03:00', 12, N'fan1595@halk.com'),
(1595, '2026-05-02T18:46:30.1339547+03:00', 12, N'fan1596@halk.com'),
(1596, '2026-05-02T18:46:30.1339549+03:00', 12, N'fan1597@halk.com'),
(1597, '2026-05-02T18:46:30.1339551+03:00', 12, N'fan1598@halk.com'),
(1598, '2026-05-02T18:46:30.1339553+03:00', 12, N'fan1599@halk.com'),
(1599, '2026-05-02T18:46:30.1339555+03:00', 12, N'fan1600@halk.com'),
(1600, '2026-05-02T18:46:30.1339557+03:00', 12, N'fan1601@halk.com'),
(1601, '2026-05-02T18:46:30.1339559+03:00', 12, N'fan1602@halk.com'),
(1602, '2026-05-02T18:46:30.1339561+03:00', 12, N'fan1603@halk.com'),
(1603, '2026-05-02T18:46:30.1339564+03:00', 12, N'fan1604@halk.com'),
(1604, '2026-05-02T18:46:30.1339566+03:00', 12, N'fan1605@halk.com'),
(1605, '2026-05-02T18:46:30.1339568+03:00', 12, N'fan1606@halk.com'),
(1606, '2026-05-02T18:46:30.1339570+03:00', 12, N'fan1607@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1607, '2026-05-02T18:46:30.1339572+03:00', 12, N'fan1608@halk.com'),
(1608, '2026-05-02T18:46:30.1339574+03:00', 12, N'fan1609@halk.com'),
(1609, '2026-05-02T18:46:30.1339576+03:00', 12, N'fan1610@halk.com'),
(1610, '2026-05-02T18:46:30.1339579+03:00', 12, N'fan1611@halk.com'),
(1611, '2026-05-02T18:46:30.1339581+03:00', 12, N'fan1612@halk.com'),
(1612, '2026-05-02T18:46:30.1339583+03:00', 12, N'fan1613@halk.com'),
(1613, '2026-05-02T18:46:30.1339585+03:00', 12, N'fan1614@halk.com'),
(1614, '2026-05-02T18:46:30.1339587+03:00', 12, N'fan1615@halk.com'),
(1615, '2026-05-02T18:46:30.1339589+03:00', 12, N'fan1616@halk.com'),
(1616, '2026-05-02T18:46:30.1339591+03:00', 12, N'fan1617@halk.com'),
(1617, '2026-05-02T18:46:30.1339593+03:00', 12, N'fan1618@halk.com'),
(1618, '2026-05-02T18:46:30.1339595+03:00', 12, N'fan1619@halk.com'),
(1619, '2026-05-02T18:46:30.1339597+03:00', 12, N'fan1620@halk.com'),
(1620, '2026-05-02T18:46:30.1339599+03:00', 12, N'fan1621@halk.com'),
(1621, '2026-05-02T18:46:30.1339601+03:00', 12, N'fan1622@halk.com'),
(1622, '2026-05-02T18:46:30.1339603+03:00', 12, N'fan1623@halk.com'),
(1623, '2026-05-02T18:46:30.1339605+03:00', 12, N'fan1624@halk.com'),
(1624, '2026-05-02T18:46:30.1339607+03:00', 12, N'fan1625@halk.com'),
(1625, '2026-05-02T18:46:30.1339609+03:00', 12, N'fan1626@halk.com'),
(1626, '2026-05-02T18:46:30.1339612+03:00', 12, N'fan1627@halk.com'),
(1627, '2026-05-02T18:46:30.1339614+03:00', 12, N'fan1628@halk.com'),
(1628, '2026-05-02T18:46:30.1339616+03:00', 12, N'fan1629@halk.com'),
(1629, '2026-05-02T18:46:30.1339618+03:00', 12, N'fan1630@halk.com'),
(1630, '2026-05-02T18:46:30.1339620+03:00', 12, N'fan1631@halk.com'),
(1631, '2026-05-02T18:46:30.1339622+03:00', 12, N'fan1632@halk.com'),
(1632, '2026-05-02T18:46:30.1339624+03:00', 12, N'fan1633@halk.com'),
(1633, '2026-05-02T18:46:30.1339626+03:00', 12, N'fan1634@halk.com'),
(1634, '2026-05-02T18:46:30.1339629+03:00', 12, N'fan1635@halk.com'),
(1635, '2026-05-02T18:46:30.1339631+03:00', 12, N'fan1636@halk.com'),
(1636, '2026-05-02T18:46:30.1339633+03:00', 12, N'fan1637@halk.com'),
(1637, '2026-05-02T18:46:30.1339635+03:00', 12, N'fan1638@halk.com'),
(1638, '2026-05-02T18:46:30.1339637+03:00', 12, N'fan1639@halk.com'),
(1639, '2026-05-02T18:46:30.1339639+03:00', 12, N'fan1640@halk.com'),
(1640, '2026-05-02T18:46:30.1339641+03:00', 12, N'fan1641@halk.com'),
(1641, '2026-05-02T18:46:30.1339643+03:00', 12, N'fan1642@halk.com'),
(1642, '2026-05-02T18:46:30.1339645+03:00', 12, N'fan1643@halk.com'),
(1643, '2026-05-02T18:46:30.1339647+03:00', 12, N'fan1644@halk.com'),
(1644, '2026-05-02T18:46:30.1339649+03:00', 12, N'fan1645@halk.com'),
(1645, '2026-05-02T18:46:30.1339651+03:00', 12, N'fan1646@halk.com'),
(1646, '2026-05-02T18:46:30.1339653+03:00', 12, N'fan1647@halk.com'),
(1647, '2026-05-02T18:46:30.1339655+03:00', 12, N'fan1648@halk.com'),
(1648, '2026-05-02T18:46:30.1339657+03:00', 12, N'fan1649@halk.com');
INSERT INTO [GalleryLikes] ([Id], [CreatedAt], [GalleryItemId], [UserEmail])
VALUES (1649, '2026-05-02T18:46:30.1339659+03:00', 12, N'fan1650@halk.com'),
(1650, '2026-05-02T18:46:30.1339661+03:00', 12, N'fan1651@halk.com'),
(1651, '2026-05-02T18:46:30.1339663+03:00', 12, N'fan1652@halk.com'),
(1652, '2026-05-02T18:46:30.1339665+03:00', 12, N'fan1653@halk.com'),
(1653, '2026-05-02T18:46:30.1339667+03:00', 12, N'fan1654@halk.com'),
(1654, '2026-05-02T18:46:30.1339669+03:00', 12, N'fan1655@halk.com'),
(1655, '2026-05-02T18:46:30.1339680+03:00', 12, N'fan1656@halk.com'),
(1656, '2026-05-02T18:46:30.1339685+03:00', 12, N'fan1657@halk.com'),
(1657, '2026-05-02T18:46:30.1339687+03:00', 12, N'fan1658@halk.com'),
(1658, '2026-05-02T18:46:30.1339690+03:00', 12, N'fan1659@halk.com'),
(1659, '2026-05-02T18:46:30.1339692+03:00', 12, N'fan1660@halk.com'),
(1660, '2026-05-02T18:46:30.1339694+03:00', 12, N'fan1661@halk.com'),
(1661, '2026-05-02T18:46:30.1339696+03:00', 12, N'fan1662@halk.com'),
(1662, '2026-05-02T18:46:30.1339698+03:00', 12, N'fan1663@halk.com'),
(1663, '2026-05-02T18:46:30.1339700+03:00', 12, N'fan1664@halk.com'),
(1664, '2026-05-02T18:46:30.1339702+03:00', 12, N'fan1665@halk.com'),
(1665, '2026-05-02T18:46:30.1339704+03:00', 12, N'fan1666@halk.com'),
(1666, '2026-05-02T18:46:30.1339707+03:00', 12, N'fan1667@halk.com'),
(1667, '2026-05-02T18:46:30.1339709+03:00', 12, N'fan1668@halk.com'),
(1668, '2026-05-02T18:46:30.1339711+03:00', 12, N'fan1669@halk.com'),
(1669, '2026-05-02T18:46:30.1339713+03:00', 12, N'fan1670@halk.com'),
(1670, '2026-05-02T18:46:30.1339715+03:00', 12, N'fan1671@halk.com'),
(1671, '2026-05-02T18:46:30.1339717+03:00', 12, N'fan1672@halk.com'),
(1672, '2026-05-02T18:46:30.1339719+03:00', 12, N'fan1673@halk.com'),
(1673, '2026-05-02T18:46:30.1339721+03:00', 12, N'fan1674@halk.com'),
(1674, '2026-05-02T18:46:30.1339723+03:00', 12, N'fan1675@halk.com'),
(1675, '2026-05-02T18:46:30.1339726+03:00', 12, N'fan1676@halk.com'),
(1676, '2026-05-02T18:46:30.1339728+03:00', 12, N'fan1677@halk.com'),
(1677, '2026-05-02T18:46:30.1339730+03:00', 12, N'fan1678@halk.com'),
(1678, '2026-05-02T18:46:30.1339732+03:00', 12, N'fan1679@halk.com'),
(1679, '2026-05-02T18:46:30.1339734+03:00', 12, N'fan1680@halk.com'),
(1680, '2026-05-02T18:46:30.1339736+03:00', 12, N'fan1681@halk.com'),
(1681, '2026-05-02T18:46:30.1339738+03:00', 12, N'fan1682@halk.com'),
(1682, '2026-05-02T18:46:30.1339740+03:00', 12, N'fan1683@halk.com'),
(1683, '2026-05-02T18:46:30.1339742+03:00', 12, N'fan1684@halk.com'),
(1684, '2026-05-02T18:46:30.1339744+03:00', 12, N'fan1685@halk.com'),
(1685, '2026-05-02T18:46:30.1339746+03:00', 12, N'fan1686@halk.com'),
(1686, '2026-05-02T18:46:30.1339748+03:00', 12, N'fan1687@halk.com'),
(1687, '2026-05-02T18:46:30.1339750+03:00', 12, N'fan1688@halk.com'),
(1688, '2026-05-02T18:46:30.1339752+03:00', 12, N'fan1689@halk.com');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CreatedAt', N'GalleryItemId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[GalleryLikes]'))
    SET IDENTITY_INSERT [GalleryLikes] OFF;

UPDATE [Instructors] SET [Title] = N'Güzellik Uzmanı'
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [News] SET [Content] = N'Halk Eğitim Merkezimizin 2026 yaz dönemi kurs kayıtları başlamıştır. 15 farklı branşta ücretsiz eğitim fırsatı!'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [News] SET [Content] = N'Bilişim teknolojileri kategorisinde yeni Python Programlama kursu açılmıştır. Yapay zeka ve veri bilimi için harika fırsat.'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [News] SET [Content] = N'2025-2026 eğitim dönemini başarıyla tamamlayan 450 kursiyerimize sertifikaları verildi.'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [News] SET [Content] = N'KOSGEB işbirliğiyle düzenlenen ücretsiz girişimcilik semineri 15 Haziran''da.'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [News] SET [Content] = N'Merkezimiz bünyesinde düzenlenecek olan ''Genç Mucitler'' yarışması için başvurular başladı.'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [News] SET [Content] = N'Yıl boyunca hazırlanan nadide eserler, 20 Mayıs''ta kapılarını açıyor.'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [News] SET [Content] = N'Her Cumartesi ''English Speaking Club'' ile dil becerilerinizi geliştirin.'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [News] SET [Content] = N'Dünya mutfağının seçkin lezzetlerini şeflerden öğrenin.'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [Content] = N'Harika haber!', [CreatedAt] = '2026-04-27T18:46:30.1321460+03:00', [UserEmail] = N'ali@mail.com'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [Content] = N'Takipteyiz, çok başarılı.', [CreatedAt] = '2026-04-28T18:46:30.1322029+03:00', [UserEmail] = N'ayse@mail.com'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [Content] = N'Emeği geçenlere teşekkürler.', [CreatedAt] = '2026-04-30T18:46:30.1322045+03:00', [NewsId] = 1, [UserEmail] = N'caner@mail.com'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [Content] = N'Harika haber!', [CreatedAt] = '2026-04-27T18:46:30.1322477+03:00', [NewsId] = 2, [UserEmail] = N'ali@mail.com'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CreatedAt', N'IsApproved', N'NewsId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[NewsComments]'))
    SET IDENTITY_INSERT [NewsComments] ON;
INSERT INTO [NewsComments] ([Id], [Content], [CreatedAt], [IsApproved], [NewsId], [UserEmail])
VALUES (5, N'Takipteyiz, çok başarılı.', '2026-04-28T18:46:30.1322482+03:00', CAST(1 AS bit), 2, N'ayse@mail.com'),
(6, N'Emeği geçenlere teşekkürler.', '2026-04-30T18:46:30.1322489+03:00', CAST(1 AS bit), 2, N'caner@mail.com'),
(7, N'Harika haber!', '2026-04-27T18:46:30.1322753+03:00', CAST(1 AS bit), 3, N'ali@mail.com'),
(8, N'Takipteyiz, çok başarılı.', '2026-04-28T18:46:30.1322755+03:00', CAST(1 AS bit), 3, N'ayse@mail.com'),
(9, N'Emeği geçenlere teşekkürler.', '2026-04-30T18:46:30.1322758+03:00', CAST(1 AS bit), 3, N'caner@mail.com'),
(10, N'Harika haber!', '2026-04-27T18:46:30.1323139+03:00', CAST(1 AS bit), 4, N'ali@mail.com'),
(11, N'Takipteyiz, çok başarılı.', '2026-04-28T18:46:30.1323141+03:00', CAST(1 AS bit), 4, N'ayse@mail.com'),
(12, N'Emeği geçenlere teşekkürler.', '2026-04-30T18:46:30.1323143+03:00', CAST(1 AS bit), 4, N'caner@mail.com'),
(13, N'Harika haber!', '2026-04-27T18:46:30.1323388+03:00', CAST(1 AS bit), 5, N'ali@mail.com'),
(14, N'Takipteyiz, çok başarılı.', '2026-04-28T18:46:30.1323390+03:00', CAST(1 AS bit), 5, N'ayse@mail.com'),
(15, N'Emeği geçenlere teşekkürler.', '2026-04-30T18:46:30.1323393+03:00', CAST(1 AS bit), 5, N'caner@mail.com'),
(16, N'Harika haber!', '2026-04-27T18:46:30.1323809+03:00', CAST(1 AS bit), 6, N'ali@mail.com'),
(17, N'Takipteyiz, çok başarılı.', '2026-04-28T18:46:30.1323811+03:00', CAST(1 AS bit), 6, N'ayse@mail.com'),
(18, N'Emeği geçenlere teşekkürler.', '2026-04-30T18:46:30.1323815+03:00', CAST(1 AS bit), 6, N'caner@mail.com'),
(19, N'Harika haber!', '2026-04-27T18:46:30.1324065+03:00', CAST(1 AS bit), 7, N'ali@mail.com'),
(20, N'Takipteyiz, çok başarılı.', '2026-04-28T18:46:30.1324067+03:00', CAST(1 AS bit), 7, N'ayse@mail.com'),
(21, N'Emeği geçenlere teşekkürler.', '2026-04-30T18:46:30.1324069+03:00', CAST(1 AS bit), 7, N'caner@mail.com'),
(22, N'Harika haber!', '2026-04-27T18:46:30.1324729+03:00', CAST(1 AS bit), 8, N'ali@mail.com'),
(23, N'Takipteyiz, çok başarılı.', '2026-04-28T18:46:30.1324733+03:00', CAST(1 AS bit), 8, N'ayse@mail.com'),
(24, N'Emeği geçenlere teşekkürler.', '2026-04-30T18:46:30.1324737+03:00', CAST(1 AS bit), 8, N'caner@mail.com');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Content', N'CreatedAt', N'IsApproved', N'NewsId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[NewsComments]'))
    SET IDENTITY_INSERT [NewsComments] OFF;

UPDATE [NewsLikes] SET [UserEmail] = N'user2@halk.com'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [UserEmail] = N'user3@halk.com'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [UserEmail] = N'user4@halk.com'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [NewsId] = 1, [UserEmail] = N'user5@halk.com'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [NewsId] = 1, [UserEmail] = N'user6@halk.com'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [NewsId] = 1, [UserEmail] = N'user7@halk.com'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [NewsId] = 1, [UserEmail] = N'user8@halk.com'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [NewsId] = 1, [UserEmail] = N'user9@halk.com'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [NewsId] = 1, [UserEmail] = N'user10@halk.com'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [NewsLikes] SET [NewsId] = 1, [UserEmail] = N'user11@halk.com'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'NewsId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[NewsLikes]'))
    SET IDENTITY_INSERT [NewsLikes] ON;
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (11, 1, N'user12@halk.com'),
(12, 1, N'user13@halk.com'),
(13, 1, N'user14@halk.com'),
(14, 1, N'user15@halk.com'),
(15, 1, N'user16@halk.com'),
(16, 1, N'user17@halk.com'),
(17, 1, N'user18@halk.com'),
(18, 1, N'user19@halk.com'),
(19, 1, N'user20@halk.com'),
(20, 1, N'user21@halk.com'),
(21, 1, N'user22@halk.com'),
(22, 1, N'user23@halk.com'),
(23, 1, N'user24@halk.com'),
(24, 1, N'user25@halk.com'),
(25, 1, N'user26@halk.com'),
(26, 1, N'user27@halk.com'),
(27, 1, N'user28@halk.com'),
(28, 1, N'user29@halk.com'),
(29, 1, N'user30@halk.com'),
(30, 1, N'user31@halk.com'),
(31, 1, N'user32@halk.com'),
(32, 1, N'user33@halk.com'),
(33, 1, N'user34@halk.com'),
(34, 1, N'user35@halk.com'),
(35, 1, N'user36@halk.com'),
(36, 1, N'user37@halk.com'),
(37, 1, N'user38@halk.com'),
(38, 1, N'user39@halk.com'),
(39, 1, N'user40@halk.com'),
(40, 1, N'user41@halk.com'),
(41, 1, N'user42@halk.com'),
(42, 1, N'user43@halk.com'),
(43, 1, N'user44@halk.com'),
(44, 1, N'user45@halk.com'),
(45, 1, N'user46@halk.com'),
(46, 1, N'user47@halk.com'),
(47, 1, N'user48@halk.com'),
(48, 1, N'user49@halk.com'),
(49, 1, N'user50@halk.com'),
(50, 1, N'user51@halk.com'),
(51, 1, N'user52@halk.com'),
(52, 1, N'user53@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (53, 1, N'user54@halk.com'),
(54, 1, N'user55@halk.com'),
(55, 1, N'user56@halk.com'),
(56, 1, N'user57@halk.com'),
(57, 1, N'user58@halk.com'),
(58, 1, N'user59@halk.com'),
(59, 1, N'user60@halk.com'),
(60, 1, N'user61@halk.com'),
(61, 1, N'user62@halk.com'),
(62, 1, N'user63@halk.com'),
(63, 1, N'user64@halk.com'),
(64, 1, N'user65@halk.com'),
(65, 1, N'user66@halk.com'),
(66, 1, N'user67@halk.com'),
(67, 1, N'user68@halk.com'),
(68, 1, N'user69@halk.com'),
(69, 1, N'user70@halk.com'),
(70, 1, N'user71@halk.com'),
(71, 1, N'user72@halk.com'),
(72, 1, N'user73@halk.com'),
(73, 1, N'user74@halk.com'),
(74, 1, N'user75@halk.com'),
(75, 1, N'user76@halk.com'),
(76, 1, N'user77@halk.com'),
(77, 1, N'user78@halk.com'),
(78, 1, N'user79@halk.com'),
(79, 1, N'user80@halk.com'),
(80, 1, N'user81@halk.com'),
(81, 1, N'user82@halk.com'),
(82, 1, N'user83@halk.com'),
(83, 1, N'user84@halk.com'),
(84, 1, N'user85@halk.com'),
(85, 1, N'user86@halk.com'),
(86, 1, N'user87@halk.com'),
(87, 1, N'user88@halk.com'),
(88, 1, N'user89@halk.com'),
(89, 1, N'user90@halk.com'),
(90, 1, N'user91@halk.com'),
(91, 1, N'user92@halk.com'),
(92, 1, N'user93@halk.com'),
(93, 1, N'user94@halk.com'),
(94, 1, N'user95@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (95, 1, N'user96@halk.com'),
(96, 1, N'user97@halk.com'),
(97, 1, N'user98@halk.com'),
(98, 1, N'user99@halk.com'),
(99, 1, N'user100@halk.com'),
(100, 1, N'user101@halk.com'),
(101, 1, N'user102@halk.com'),
(102, 1, N'user103@halk.com'),
(103, 1, N'user104@halk.com'),
(104, 1, N'user105@halk.com'),
(105, 1, N'user106@halk.com'),
(106, 1, N'user107@halk.com'),
(107, 1, N'user108@halk.com'),
(108, 1, N'user109@halk.com'),
(109, 1, N'user110@halk.com'),
(110, 1, N'user111@halk.com'),
(111, 1, N'user112@halk.com'),
(112, 1, N'user113@halk.com'),
(113, 1, N'user114@halk.com'),
(114, 1, N'user115@halk.com'),
(115, 1, N'user116@halk.com'),
(116, 1, N'user117@halk.com'),
(117, 1, N'user118@halk.com'),
(118, 1, N'user119@halk.com'),
(119, 1, N'user120@halk.com'),
(120, 1, N'user121@halk.com'),
(121, 1, N'user122@halk.com'),
(122, 1, N'user123@halk.com'),
(123, 1, N'user124@halk.com'),
(124, 1, N'user125@halk.com'),
(125, 1, N'user126@halk.com'),
(126, 1, N'user127@halk.com'),
(127, 1, N'user128@halk.com'),
(128, 1, N'user129@halk.com'),
(129, 1, N'user130@halk.com'),
(130, 1, N'user131@halk.com'),
(131, 1, N'user132@halk.com'),
(132, 1, N'user133@halk.com'),
(133, 1, N'user134@halk.com'),
(134, 1, N'user135@halk.com'),
(135, 1, N'user136@halk.com'),
(136, 1, N'user137@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (137, 1, N'user138@halk.com'),
(138, 1, N'user139@halk.com'),
(139, 1, N'user140@halk.com'),
(140, 1, N'user141@halk.com'),
(141, 1, N'user142@halk.com'),
(142, 1, N'user143@halk.com'),
(143, 1, N'user144@halk.com'),
(144, 1, N'user145@halk.com'),
(145, 1, N'user146@halk.com'),
(146, 1, N'user147@halk.com'),
(147, 1, N'user148@halk.com'),
(148, 1, N'user149@halk.com'),
(149, 1, N'user150@halk.com'),
(150, 1, N'user151@halk.com'),
(151, 1, N'user152@halk.com'),
(152, 1, N'user153@halk.com'),
(153, 1, N'user154@halk.com'),
(154, 1, N'user155@halk.com'),
(155, 1, N'user156@halk.com'),
(156, 1, N'user157@halk.com'),
(157, 2, N'user158@halk.com'),
(158, 2, N'user159@halk.com'),
(159, 2, N'user160@halk.com'),
(160, 2, N'user161@halk.com'),
(161, 2, N'user162@halk.com'),
(162, 2, N'user163@halk.com'),
(163, 2, N'user164@halk.com'),
(164, 2, N'user165@halk.com'),
(165, 2, N'user166@halk.com'),
(166, 2, N'user167@halk.com'),
(167, 2, N'user168@halk.com'),
(168, 2, N'user169@halk.com'),
(169, 2, N'user170@halk.com'),
(170, 2, N'user171@halk.com'),
(171, 2, N'user172@halk.com'),
(172, 2, N'user173@halk.com'),
(173, 2, N'user174@halk.com'),
(174, 2, N'user175@halk.com'),
(175, 2, N'user176@halk.com'),
(176, 2, N'user177@halk.com'),
(177, 2, N'user178@halk.com'),
(178, 2, N'user179@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (179, 2, N'user180@halk.com'),
(180, 2, N'user181@halk.com'),
(181, 2, N'user182@halk.com'),
(182, 2, N'user183@halk.com'),
(183, 2, N'user184@halk.com'),
(184, 2, N'user185@halk.com'),
(185, 2, N'user186@halk.com'),
(186, 2, N'user187@halk.com'),
(187, 2, N'user188@halk.com'),
(188, 2, N'user189@halk.com'),
(189, 2, N'user190@halk.com'),
(190, 2, N'user191@halk.com'),
(191, 2, N'user192@halk.com'),
(192, 2, N'user193@halk.com'),
(193, 2, N'user194@halk.com'),
(194, 2, N'user195@halk.com'),
(195, 2, N'user196@halk.com'),
(196, 2, N'user197@halk.com'),
(197, 2, N'user198@halk.com'),
(198, 2, N'user199@halk.com'),
(199, 2, N'user200@halk.com'),
(200, 2, N'user201@halk.com'),
(201, 2, N'user202@halk.com'),
(202, 2, N'user203@halk.com'),
(203, 2, N'user204@halk.com'),
(204, 2, N'user205@halk.com'),
(205, 2, N'user206@halk.com'),
(206, 2, N'user207@halk.com'),
(207, 2, N'user208@halk.com'),
(208, 2, N'user209@halk.com'),
(209, 2, N'user210@halk.com'),
(210, 2, N'user211@halk.com'),
(211, 2, N'user212@halk.com'),
(212, 2, N'user213@halk.com'),
(213, 2, N'user214@halk.com'),
(214, 2, N'user215@halk.com'),
(215, 2, N'user216@halk.com'),
(216, 2, N'user217@halk.com'),
(217, 2, N'user218@halk.com'),
(218, 2, N'user219@halk.com'),
(219, 2, N'user220@halk.com'),
(220, 2, N'user221@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (221, 2, N'user222@halk.com'),
(222, 2, N'user223@halk.com'),
(223, 2, N'user224@halk.com'),
(224, 2, N'user225@halk.com'),
(225, 2, N'user226@halk.com'),
(226, 2, N'user227@halk.com'),
(227, 2, N'user228@halk.com'),
(228, 2, N'user229@halk.com'),
(229, 2, N'user230@halk.com'),
(230, 2, N'user231@halk.com'),
(231, 2, N'user232@halk.com'),
(232, 2, N'user233@halk.com'),
(233, 2, N'user234@halk.com'),
(234, 2, N'user235@halk.com'),
(235, 2, N'user236@halk.com'),
(236, 2, N'user237@halk.com'),
(237, 2, N'user238@halk.com'),
(238, 2, N'user239@halk.com'),
(239, 2, N'user240@halk.com'),
(240, 2, N'user241@halk.com'),
(241, 2, N'user242@halk.com'),
(242, 2, N'user243@halk.com'),
(243, 2, N'user244@halk.com'),
(244, 2, N'user245@halk.com'),
(245, 2, N'user246@halk.com'),
(246, 2, N'user247@halk.com'),
(247, 2, N'user248@halk.com'),
(248, 2, N'user249@halk.com'),
(249, 2, N'user250@halk.com'),
(250, 2, N'user251@halk.com'),
(251, 2, N'user252@halk.com'),
(252, 2, N'user253@halk.com'),
(253, 2, N'user254@halk.com'),
(254, 2, N'user255@halk.com'),
(255, 2, N'user256@halk.com'),
(256, 2, N'user257@halk.com'),
(257, 2, N'user258@halk.com'),
(258, 2, N'user259@halk.com'),
(259, 2, N'user260@halk.com'),
(260, 2, N'user261@halk.com'),
(261, 2, N'user262@halk.com'),
(262, 2, N'user263@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (263, 2, N'user264@halk.com'),
(264, 2, N'user265@halk.com'),
(265, 2, N'user266@halk.com'),
(266, 2, N'user267@halk.com'),
(267, 2, N'user268@halk.com'),
(268, 2, N'user269@halk.com'),
(269, 2, N'user270@halk.com'),
(270, 2, N'user271@halk.com'),
(271, 2, N'user272@halk.com'),
(272, 2, N'user273@halk.com'),
(273, 2, N'user274@halk.com'),
(274, 2, N'user275@halk.com'),
(275, 2, N'user276@halk.com'),
(276, 2, N'user277@halk.com'),
(277, 2, N'user278@halk.com'),
(278, 2, N'user279@halk.com'),
(279, 2, N'user280@halk.com'),
(280, 2, N'user281@halk.com'),
(281, 2, N'user282@halk.com'),
(282, 2, N'user283@halk.com'),
(283, 2, N'user284@halk.com'),
(284, 2, N'user285@halk.com'),
(285, 2, N'user286@halk.com'),
(286, 2, N'user287@halk.com'),
(287, 2, N'user288@halk.com'),
(288, 2, N'user289@halk.com'),
(289, 2, N'user290@halk.com'),
(290, 2, N'user291@halk.com'),
(291, 2, N'user292@halk.com'),
(292, 2, N'user293@halk.com'),
(293, 2, N'user294@halk.com'),
(294, 2, N'user295@halk.com'),
(295, 2, N'user296@halk.com'),
(296, 2, N'user297@halk.com'),
(297, 2, N'user298@halk.com'),
(298, 2, N'user299@halk.com'),
(299, 2, N'user300@halk.com'),
(300, 2, N'user301@halk.com'),
(301, 2, N'user302@halk.com'),
(302, 2, N'user303@halk.com'),
(303, 2, N'user304@halk.com'),
(304, 2, N'user305@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (305, 2, N'user306@halk.com'),
(306, 2, N'user307@halk.com'),
(307, 2, N'user308@halk.com'),
(308, 2, N'user309@halk.com'),
(309, 2, N'user310@halk.com'),
(310, 2, N'user311@halk.com'),
(311, 2, N'user312@halk.com'),
(312, 2, N'user313@halk.com'),
(313, 2, N'user314@halk.com'),
(314, 2, N'user315@halk.com'),
(315, 2, N'user316@halk.com'),
(316, 2, N'user317@halk.com'),
(317, 2, N'user318@halk.com'),
(318, 2, N'user319@halk.com'),
(319, 2, N'user320@halk.com'),
(320, 2, N'user321@halk.com'),
(321, 2, N'user322@halk.com'),
(322, 2, N'user323@halk.com'),
(323, 2, N'user324@halk.com'),
(324, 2, N'user325@halk.com'),
(325, 2, N'user326@halk.com'),
(326, 2, N'user327@halk.com'),
(327, 2, N'user328@halk.com'),
(328, 2, N'user329@halk.com'),
(329, 2, N'user330@halk.com'),
(330, 2, N'user331@halk.com'),
(331, 2, N'user332@halk.com'),
(332, 2, N'user333@halk.com'),
(333, 2, N'user334@halk.com'),
(334, 2, N'user335@halk.com'),
(335, 2, N'user336@halk.com'),
(336, 2, N'user337@halk.com'),
(337, 2, N'user338@halk.com'),
(338, 2, N'user339@halk.com'),
(339, 2, N'user340@halk.com'),
(340, 2, N'user341@halk.com'),
(341, 2, N'user342@halk.com'),
(342, 2, N'user343@halk.com'),
(343, 2, N'user344@halk.com'),
(344, 2, N'user345@halk.com'),
(345, 2, N'user346@halk.com'),
(346, 2, N'user347@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (347, 2, N'user348@halk.com'),
(348, 2, N'user349@halk.com'),
(349, 2, N'user350@halk.com'),
(350, 2, N'user351@halk.com'),
(351, 2, N'user352@halk.com'),
(352, 2, N'user353@halk.com'),
(353, 2, N'user354@halk.com'),
(354, 2, N'user355@halk.com'),
(355, 2, N'user356@halk.com'),
(356, 2, N'user357@halk.com'),
(357, 2, N'user358@halk.com'),
(358, 2, N'user359@halk.com'),
(359, 2, N'user360@halk.com'),
(360, 2, N'user361@halk.com'),
(361, 2, N'user362@halk.com'),
(362, 2, N'user363@halk.com'),
(363, 2, N'user364@halk.com'),
(364, 2, N'user365@halk.com'),
(365, 2, N'user366@halk.com'),
(366, 2, N'user367@halk.com'),
(367, 2, N'user368@halk.com'),
(368, 2, N'user369@halk.com'),
(369, 2, N'user370@halk.com'),
(370, 2, N'user371@halk.com'),
(371, 2, N'user372@halk.com'),
(372, 2, N'user373@halk.com'),
(373, 2, N'user374@halk.com'),
(374, 2, N'user375@halk.com'),
(375, 2, N'user376@halk.com'),
(376, 2, N'user377@halk.com'),
(377, 2, N'user378@halk.com'),
(378, 2, N'user379@halk.com'),
(379, 2, N'user380@halk.com'),
(380, 2, N'user381@halk.com'),
(381, 2, N'user382@halk.com'),
(382, 2, N'user383@halk.com'),
(383, 2, N'user384@halk.com'),
(384, 2, N'user385@halk.com'),
(385, 2, N'user386@halk.com'),
(386, 2, N'user387@halk.com'),
(387, 2, N'user388@halk.com'),
(388, 2, N'user389@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (389, 2, N'user390@halk.com'),
(390, 2, N'user391@halk.com'),
(391, 2, N'user392@halk.com'),
(392, 2, N'user393@halk.com'),
(393, 2, N'user394@halk.com'),
(394, 2, N'user395@halk.com'),
(395, 2, N'user396@halk.com'),
(396, 2, N'user397@halk.com'),
(397, 2, N'user398@halk.com'),
(398, 2, N'user399@halk.com'),
(399, 2, N'user400@halk.com'),
(400, 2, N'user401@halk.com'),
(401, 2, N'user402@halk.com'),
(402, 3, N'user403@halk.com'),
(403, 3, N'user404@halk.com'),
(404, 3, N'user405@halk.com'),
(405, 3, N'user406@halk.com'),
(406, 3, N'user407@halk.com'),
(407, 3, N'user408@halk.com'),
(408, 3, N'user409@halk.com'),
(409, 3, N'user410@halk.com'),
(410, 3, N'user411@halk.com'),
(411, 3, N'user412@halk.com'),
(412, 3, N'user413@halk.com'),
(413, 3, N'user414@halk.com'),
(414, 3, N'user415@halk.com'),
(415, 3, N'user416@halk.com'),
(416, 3, N'user417@halk.com'),
(417, 3, N'user418@halk.com'),
(418, 3, N'user419@halk.com'),
(419, 3, N'user420@halk.com'),
(420, 3, N'user421@halk.com'),
(421, 3, N'user422@halk.com'),
(422, 3, N'user423@halk.com'),
(423, 3, N'user424@halk.com'),
(424, 3, N'user425@halk.com'),
(425, 3, N'user426@halk.com'),
(426, 3, N'user427@halk.com'),
(427, 3, N'user428@halk.com'),
(428, 3, N'user429@halk.com'),
(429, 3, N'user430@halk.com'),
(430, 3, N'user431@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (431, 3, N'user432@halk.com'),
(432, 3, N'user433@halk.com'),
(433, 3, N'user434@halk.com'),
(434, 3, N'user435@halk.com'),
(435, 3, N'user436@halk.com'),
(436, 3, N'user437@halk.com'),
(437, 3, N'user438@halk.com'),
(438, 3, N'user439@halk.com'),
(439, 3, N'user440@halk.com'),
(440, 3, N'user441@halk.com'),
(441, 3, N'user442@halk.com'),
(442, 3, N'user443@halk.com'),
(443, 3, N'user444@halk.com'),
(444, 3, N'user445@halk.com'),
(445, 3, N'user446@halk.com'),
(446, 3, N'user447@halk.com'),
(447, 3, N'user448@halk.com'),
(448, 3, N'user449@halk.com'),
(449, 3, N'user450@halk.com'),
(450, 3, N'user451@halk.com'),
(451, 3, N'user452@halk.com'),
(452, 3, N'user453@halk.com'),
(453, 3, N'user454@halk.com'),
(454, 3, N'user455@halk.com'),
(455, 3, N'user456@halk.com'),
(456, 3, N'user457@halk.com'),
(457, 3, N'user458@halk.com'),
(458, 3, N'user459@halk.com'),
(459, 3, N'user460@halk.com'),
(460, 3, N'user461@halk.com'),
(461, 3, N'user462@halk.com'),
(462, 3, N'user463@halk.com'),
(463, 3, N'user464@halk.com'),
(464, 3, N'user465@halk.com'),
(465, 3, N'user466@halk.com'),
(466, 3, N'user467@halk.com'),
(467, 3, N'user468@halk.com'),
(468, 3, N'user469@halk.com'),
(469, 3, N'user470@halk.com'),
(470, 3, N'user471@halk.com'),
(471, 3, N'user472@halk.com'),
(472, 3, N'user473@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (473, 3, N'user474@halk.com'),
(474, 3, N'user475@halk.com'),
(475, 3, N'user476@halk.com'),
(476, 3, N'user477@halk.com'),
(477, 3, N'user478@halk.com'),
(478, 3, N'user479@halk.com'),
(479, 3, N'user480@halk.com'),
(480, 3, N'user481@halk.com'),
(481, 3, N'user482@halk.com'),
(482, 3, N'user483@halk.com'),
(483, 3, N'user484@halk.com'),
(484, 3, N'user485@halk.com'),
(485, 3, N'user486@halk.com'),
(486, 3, N'user487@halk.com'),
(487, 3, N'user488@halk.com'),
(488, 3, N'user489@halk.com'),
(489, 3, N'user490@halk.com'),
(490, 3, N'user491@halk.com'),
(491, 3, N'user492@halk.com'),
(492, 3, N'user493@halk.com'),
(493, 3, N'user494@halk.com'),
(494, 3, N'user495@halk.com'),
(495, 3, N'user496@halk.com'),
(496, 3, N'user497@halk.com'),
(497, 3, N'user498@halk.com'),
(498, 3, N'user499@halk.com'),
(499, 3, N'user500@halk.com'),
(500, 3, N'user501@halk.com'),
(501, 3, N'user502@halk.com'),
(502, 3, N'user503@halk.com'),
(503, 3, N'user504@halk.com'),
(504, 3, N'user505@halk.com'),
(505, 3, N'user506@halk.com'),
(506, 3, N'user507@halk.com'),
(507, 3, N'user508@halk.com'),
(508, 3, N'user509@halk.com'),
(509, 3, N'user510@halk.com'),
(510, 3, N'user511@halk.com'),
(511, 3, N'user512@halk.com'),
(512, 3, N'user513@halk.com'),
(513, 3, N'user514@halk.com'),
(514, 3, N'user515@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (515, 3, N'user516@halk.com'),
(516, 3, N'user517@halk.com'),
(517, 3, N'user518@halk.com'),
(518, 3, N'user519@halk.com'),
(519, 3, N'user520@halk.com'),
(520, 3, N'user521@halk.com'),
(521, 3, N'user522@halk.com'),
(522, 3, N'user523@halk.com'),
(523, 3, N'user524@halk.com'),
(524, 3, N'user525@halk.com'),
(525, 3, N'user526@halk.com'),
(526, 3, N'user527@halk.com'),
(527, 3, N'user528@halk.com'),
(528, 3, N'user529@halk.com'),
(529, 3, N'user530@halk.com'),
(530, 3, N'user531@halk.com'),
(531, 3, N'user532@halk.com'),
(532, 3, N'user533@halk.com'),
(533, 3, N'user534@halk.com'),
(534, 3, N'user535@halk.com'),
(535, 3, N'user536@halk.com'),
(536, 3, N'user537@halk.com'),
(537, 3, N'user538@halk.com'),
(538, 3, N'user539@halk.com'),
(539, 3, N'user540@halk.com'),
(540, 3, N'user541@halk.com'),
(541, 3, N'user542@halk.com'),
(542, 3, N'user543@halk.com'),
(543, 3, N'user544@halk.com'),
(544, 3, N'user545@halk.com'),
(545, 3, N'user546@halk.com'),
(546, 3, N'user547@halk.com'),
(547, 3, N'user548@halk.com'),
(548, 3, N'user549@halk.com'),
(549, 3, N'user550@halk.com'),
(550, 3, N'user551@halk.com'),
(551, 3, N'user552@halk.com'),
(552, 3, N'user553@halk.com'),
(553, 3, N'user554@halk.com'),
(554, 3, N'user555@halk.com'),
(555, 3, N'user556@halk.com'),
(556, 3, N'user557@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (557, 3, N'user558@halk.com'),
(558, 4, N'user559@halk.com'),
(559, 4, N'user560@halk.com'),
(560, 4, N'user561@halk.com'),
(561, 4, N'user562@halk.com'),
(562, 4, N'user563@halk.com'),
(563, 4, N'user564@halk.com'),
(564, 4, N'user565@halk.com'),
(565, 4, N'user566@halk.com'),
(566, 4, N'user567@halk.com'),
(567, 4, N'user568@halk.com'),
(568, 4, N'user569@halk.com'),
(569, 4, N'user570@halk.com'),
(570, 4, N'user571@halk.com'),
(571, 4, N'user572@halk.com'),
(572, 4, N'user573@halk.com'),
(573, 4, N'user574@halk.com'),
(574, 4, N'user575@halk.com'),
(575, 4, N'user576@halk.com'),
(576, 4, N'user577@halk.com'),
(577, 4, N'user578@halk.com'),
(578, 4, N'user579@halk.com'),
(579, 4, N'user580@halk.com'),
(580, 4, N'user581@halk.com'),
(581, 4, N'user582@halk.com'),
(582, 4, N'user583@halk.com'),
(583, 4, N'user584@halk.com'),
(584, 4, N'user585@halk.com'),
(585, 4, N'user586@halk.com'),
(586, 4, N'user587@halk.com'),
(587, 4, N'user588@halk.com'),
(588, 4, N'user589@halk.com'),
(589, 4, N'user590@halk.com'),
(590, 4, N'user591@halk.com'),
(591, 4, N'user592@halk.com'),
(592, 4, N'user593@halk.com'),
(593, 4, N'user594@halk.com'),
(594, 4, N'user595@halk.com'),
(595, 4, N'user596@halk.com'),
(596, 4, N'user597@halk.com'),
(597, 4, N'user598@halk.com'),
(598, 4, N'user599@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (599, 4, N'user600@halk.com'),
(600, 4, N'user601@halk.com'),
(601, 4, N'user602@halk.com'),
(602, 4, N'user603@halk.com'),
(603, 4, N'user604@halk.com'),
(604, 4, N'user605@halk.com'),
(605, 4, N'user606@halk.com'),
(606, 4, N'user607@halk.com'),
(607, 4, N'user608@halk.com'),
(608, 4, N'user609@halk.com'),
(609, 4, N'user610@halk.com'),
(610, 4, N'user611@halk.com'),
(611, 4, N'user612@halk.com'),
(612, 4, N'user613@halk.com'),
(613, 4, N'user614@halk.com'),
(614, 4, N'user615@halk.com'),
(615, 4, N'user616@halk.com'),
(616, 4, N'user617@halk.com'),
(617, 4, N'user618@halk.com'),
(618, 4, N'user619@halk.com'),
(619, 4, N'user620@halk.com'),
(620, 4, N'user621@halk.com'),
(621, 4, N'user622@halk.com'),
(622, 4, N'user623@halk.com'),
(623, 4, N'user624@halk.com'),
(624, 4, N'user625@halk.com'),
(625, 4, N'user626@halk.com'),
(626, 4, N'user627@halk.com'),
(627, 4, N'user628@halk.com'),
(628, 4, N'user629@halk.com'),
(629, 4, N'user630@halk.com'),
(630, 4, N'user631@halk.com'),
(631, 4, N'user632@halk.com'),
(632, 4, N'user633@halk.com'),
(633, 4, N'user634@halk.com'),
(634, 4, N'user635@halk.com'),
(635, 4, N'user636@halk.com'),
(636, 4, N'user637@halk.com'),
(637, 4, N'user638@halk.com'),
(638, 4, N'user639@halk.com'),
(639, 4, N'user640@halk.com'),
(640, 4, N'user641@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (641, 4, N'user642@halk.com'),
(642, 4, N'user643@halk.com'),
(643, 4, N'user644@halk.com'),
(644, 4, N'user645@halk.com'),
(645, 4, N'user646@halk.com'),
(646, 4, N'user647@halk.com'),
(647, 4, N'user648@halk.com'),
(648, 4, N'user649@halk.com'),
(649, 4, N'user650@halk.com'),
(650, 4, N'user651@halk.com'),
(651, 4, N'user652@halk.com'),
(652, 4, N'user653@halk.com'),
(653, 4, N'user654@halk.com'),
(654, 4, N'user655@halk.com'),
(655, 4, N'user656@halk.com'),
(656, 4, N'user657@halk.com'),
(657, 4, N'user658@halk.com'),
(658, 4, N'user659@halk.com'),
(659, 4, N'user660@halk.com'),
(660, 4, N'user661@halk.com'),
(661, 4, N'user662@halk.com'),
(662, 4, N'user663@halk.com'),
(663, 4, N'user664@halk.com'),
(664, 4, N'user665@halk.com'),
(665, 4, N'user666@halk.com'),
(666, 4, N'user667@halk.com'),
(667, 4, N'user668@halk.com'),
(668, 4, N'user669@halk.com'),
(669, 4, N'user670@halk.com'),
(670, 4, N'user671@halk.com'),
(671, 4, N'user672@halk.com'),
(672, 4, N'user673@halk.com'),
(673, 4, N'user674@halk.com'),
(674, 4, N'user675@halk.com'),
(675, 4, N'user676@halk.com'),
(676, 4, N'user677@halk.com'),
(677, 4, N'user678@halk.com'),
(678, 4, N'user679@halk.com'),
(679, 4, N'user680@halk.com'),
(680, 4, N'user681@halk.com'),
(681, 4, N'user682@halk.com'),
(682, 4, N'user683@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (683, 4, N'user684@halk.com'),
(684, 4, N'user685@halk.com'),
(685, 4, N'user686@halk.com'),
(686, 4, N'user687@halk.com'),
(687, 4, N'user688@halk.com'),
(688, 4, N'user689@halk.com'),
(689, 4, N'user690@halk.com'),
(690, 4, N'user691@halk.com'),
(691, 4, N'user692@halk.com'),
(692, 4, N'user693@halk.com'),
(693, 4, N'user694@halk.com'),
(694, 4, N'user695@halk.com'),
(695, 4, N'user696@halk.com'),
(696, 4, N'user697@halk.com'),
(697, 4, N'user698@halk.com'),
(698, 4, N'user699@halk.com'),
(699, 4, N'user700@halk.com'),
(700, 4, N'user701@halk.com'),
(701, 4, N'user702@halk.com'),
(702, 4, N'user703@halk.com'),
(703, 4, N'user704@halk.com'),
(704, 4, N'user705@halk.com'),
(705, 4, N'user706@halk.com'),
(706, 4, N'user707@halk.com'),
(707, 4, N'user708@halk.com'),
(708, 4, N'user709@halk.com'),
(709, 4, N'user710@halk.com'),
(710, 4, N'user711@halk.com'),
(711, 4, N'user712@halk.com'),
(712, 4, N'user713@halk.com'),
(713, 4, N'user714@halk.com'),
(714, 4, N'user715@halk.com'),
(715, 4, N'user716@halk.com'),
(716, 4, N'user717@halk.com'),
(717, 4, N'user718@halk.com'),
(718, 4, N'user719@halk.com'),
(719, 4, N'user720@halk.com'),
(720, 4, N'user721@halk.com'),
(721, 4, N'user722@halk.com'),
(722, 4, N'user723@halk.com'),
(723, 4, N'user724@halk.com'),
(724, 4, N'user725@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (725, 4, N'user726@halk.com'),
(726, 4, N'user727@halk.com'),
(727, 4, N'user728@halk.com'),
(728, 4, N'user729@halk.com'),
(729, 4, N'user730@halk.com'),
(730, 4, N'user731@halk.com'),
(731, 4, N'user732@halk.com'),
(732, 4, N'user733@halk.com'),
(733, 4, N'user734@halk.com'),
(734, 4, N'user735@halk.com'),
(735, 4, N'user736@halk.com'),
(736, 4, N'user737@halk.com'),
(737, 4, N'user738@halk.com'),
(738, 4, N'user739@halk.com'),
(739, 4, N'user740@halk.com'),
(740, 4, N'user741@halk.com'),
(741, 4, N'user742@halk.com'),
(742, 4, N'user743@halk.com'),
(743, 4, N'user744@halk.com'),
(744, 4, N'user745@halk.com'),
(745, 4, N'user746@halk.com'),
(746, 4, N'user747@halk.com'),
(747, 4, N'user748@halk.com'),
(748, 4, N'user749@halk.com'),
(749, 4, N'user750@halk.com'),
(750, 4, N'user751@halk.com'),
(751, 4, N'user752@halk.com'),
(752, 4, N'user753@halk.com'),
(753, 4, N'user754@halk.com'),
(754, 4, N'user755@halk.com'),
(755, 4, N'user756@halk.com'),
(756, 4, N'user757@halk.com'),
(757, 4, N'user758@halk.com'),
(758, 4, N'user759@halk.com'),
(759, 4, N'user760@halk.com'),
(760, 4, N'user761@halk.com'),
(761, 4, N'user762@halk.com'),
(762, 4, N'user763@halk.com'),
(763, 4, N'user764@halk.com'),
(764, 4, N'user765@halk.com'),
(765, 4, N'user766@halk.com'),
(766, 4, N'user767@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (767, 4, N'user768@halk.com'),
(768, 4, N'user769@halk.com'),
(769, 4, N'user770@halk.com'),
(770, 4, N'user771@halk.com'),
(771, 4, N'user772@halk.com'),
(772, 4, N'user773@halk.com'),
(773, 4, N'user774@halk.com'),
(774, 4, N'user775@halk.com'),
(775, 4, N'user776@halk.com'),
(776, 4, N'user777@halk.com'),
(777, 4, N'user778@halk.com'),
(778, 4, N'user779@halk.com'),
(779, 4, N'user780@halk.com'),
(780, 4, N'user781@halk.com'),
(781, 4, N'user782@halk.com'),
(782, 4, N'user783@halk.com'),
(783, 4, N'user784@halk.com'),
(784, 4, N'user785@halk.com'),
(785, 4, N'user786@halk.com'),
(786, 4, N'user787@halk.com'),
(787, 4, N'user788@halk.com'),
(788, 4, N'user789@halk.com'),
(789, 4, N'user790@halk.com'),
(790, 4, N'user791@halk.com'),
(791, 4, N'user792@halk.com'),
(792, 4, N'user793@halk.com'),
(793, 4, N'user794@halk.com'),
(794, 4, N'user795@halk.com'),
(795, 4, N'user796@halk.com'),
(796, 4, N'user797@halk.com'),
(797, 4, N'user798@halk.com'),
(798, 4, N'user799@halk.com'),
(799, 4, N'user800@halk.com'),
(800, 4, N'user801@halk.com'),
(801, 4, N'user802@halk.com'),
(802, 4, N'user803@halk.com'),
(803, 5, N'user804@halk.com'),
(804, 5, N'user805@halk.com'),
(805, 5, N'user806@halk.com'),
(806, 5, N'user807@halk.com'),
(807, 5, N'user808@halk.com'),
(808, 5, N'user809@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (809, 5, N'user810@halk.com'),
(810, 5, N'user811@halk.com'),
(811, 5, N'user812@halk.com'),
(812, 5, N'user813@halk.com'),
(813, 5, N'user814@halk.com'),
(814, 5, N'user815@halk.com'),
(815, 5, N'user816@halk.com'),
(816, 5, N'user817@halk.com'),
(817, 5, N'user818@halk.com'),
(818, 5, N'user819@halk.com'),
(819, 5, N'user820@halk.com'),
(820, 5, N'user821@halk.com'),
(821, 5, N'user822@halk.com'),
(822, 5, N'user823@halk.com'),
(823, 5, N'user824@halk.com'),
(824, 5, N'user825@halk.com'),
(825, 5, N'user826@halk.com'),
(826, 5, N'user827@halk.com'),
(827, 5, N'user828@halk.com'),
(828, 5, N'user829@halk.com'),
(829, 5, N'user830@halk.com'),
(830, 5, N'user831@halk.com'),
(831, 5, N'user832@halk.com'),
(832, 5, N'user833@halk.com'),
(833, 5, N'user834@halk.com'),
(834, 5, N'user835@halk.com'),
(835, 5, N'user836@halk.com'),
(836, 5, N'user837@halk.com'),
(837, 5, N'user838@halk.com'),
(838, 5, N'user839@halk.com'),
(839, 5, N'user840@halk.com'),
(840, 5, N'user841@halk.com'),
(841, 5, N'user842@halk.com'),
(842, 5, N'user843@halk.com'),
(843, 5, N'user844@halk.com'),
(844, 5, N'user845@halk.com'),
(845, 5, N'user846@halk.com'),
(846, 5, N'user847@halk.com'),
(847, 5, N'user848@halk.com'),
(848, 5, N'user849@halk.com'),
(849, 5, N'user850@halk.com'),
(850, 5, N'user851@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (851, 5, N'user852@halk.com'),
(852, 5, N'user853@halk.com'),
(853, 5, N'user854@halk.com'),
(854, 5, N'user855@halk.com'),
(855, 5, N'user856@halk.com'),
(856, 5, N'user857@halk.com'),
(857, 5, N'user858@halk.com'),
(858, 5, N'user859@halk.com'),
(859, 5, N'user860@halk.com'),
(860, 5, N'user861@halk.com'),
(861, 5, N'user862@halk.com'),
(862, 5, N'user863@halk.com'),
(863, 5, N'user864@halk.com'),
(864, 5, N'user865@halk.com'),
(865, 5, N'user866@halk.com'),
(866, 5, N'user867@halk.com'),
(867, 5, N'user868@halk.com'),
(868, 5, N'user869@halk.com'),
(869, 5, N'user870@halk.com'),
(870, 5, N'user871@halk.com'),
(871, 5, N'user872@halk.com'),
(872, 5, N'user873@halk.com'),
(873, 5, N'user874@halk.com'),
(874, 5, N'user875@halk.com'),
(875, 5, N'user876@halk.com'),
(876, 5, N'user877@halk.com'),
(877, 5, N'user878@halk.com'),
(878, 5, N'user879@halk.com'),
(879, 5, N'user880@halk.com'),
(880, 5, N'user881@halk.com'),
(881, 5, N'user882@halk.com'),
(882, 5, N'user883@halk.com'),
(883, 5, N'user884@halk.com'),
(884, 5, N'user885@halk.com'),
(885, 5, N'user886@halk.com'),
(886, 5, N'user887@halk.com'),
(887, 5, N'user888@halk.com'),
(888, 5, N'user889@halk.com'),
(889, 5, N'user890@halk.com'),
(890, 5, N'user891@halk.com'),
(891, 5, N'user892@halk.com'),
(892, 5, N'user893@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (893, 5, N'user894@halk.com'),
(894, 5, N'user895@halk.com'),
(895, 5, N'user896@halk.com'),
(896, 5, N'user897@halk.com'),
(897, 5, N'user898@halk.com'),
(898, 5, N'user899@halk.com'),
(899, 5, N'user900@halk.com'),
(900, 5, N'user901@halk.com'),
(901, 5, N'user902@halk.com'),
(902, 5, N'user903@halk.com'),
(903, 5, N'user904@halk.com'),
(904, 5, N'user905@halk.com'),
(905, 5, N'user906@halk.com'),
(906, 5, N'user907@halk.com'),
(907, 5, N'user908@halk.com'),
(908, 5, N'user909@halk.com'),
(909, 5, N'user910@halk.com'),
(910, 5, N'user911@halk.com'),
(911, 5, N'user912@halk.com'),
(912, 5, N'user913@halk.com'),
(913, 5, N'user914@halk.com'),
(914, 5, N'user915@halk.com'),
(915, 5, N'user916@halk.com'),
(916, 5, N'user917@halk.com'),
(917, 5, N'user918@halk.com'),
(918, 5, N'user919@halk.com'),
(919, 5, N'user920@halk.com'),
(920, 5, N'user921@halk.com'),
(921, 5, N'user922@halk.com'),
(922, 5, N'user923@halk.com'),
(923, 5, N'user924@halk.com'),
(924, 5, N'user925@halk.com'),
(925, 5, N'user926@halk.com'),
(926, 5, N'user927@halk.com'),
(927, 5, N'user928@halk.com'),
(928, 5, N'user929@halk.com'),
(929, 5, N'user930@halk.com'),
(930, 5, N'user931@halk.com'),
(931, 5, N'user932@halk.com'),
(932, 5, N'user933@halk.com'),
(933, 5, N'user934@halk.com'),
(934, 5, N'user935@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (935, 5, N'user936@halk.com'),
(936, 5, N'user937@halk.com'),
(937, 5, N'user938@halk.com'),
(938, 5, N'user939@halk.com'),
(939, 5, N'user940@halk.com'),
(940, 5, N'user941@halk.com'),
(941, 5, N'user942@halk.com'),
(942, 5, N'user943@halk.com'),
(943, 5, N'user944@halk.com'),
(944, 5, N'user945@halk.com'),
(945, 5, N'user946@halk.com'),
(946, 5, N'user947@halk.com'),
(947, 5, N'user948@halk.com'),
(948, 5, N'user949@halk.com'),
(949, 5, N'user950@halk.com'),
(950, 5, N'user951@halk.com'),
(951, 5, N'user952@halk.com'),
(952, 5, N'user953@halk.com'),
(953, 5, N'user954@halk.com'),
(954, 5, N'user955@halk.com'),
(955, 5, N'user956@halk.com'),
(956, 5, N'user957@halk.com'),
(957, 5, N'user958@halk.com'),
(958, 5, N'user959@halk.com'),
(959, 6, N'user960@halk.com'),
(960, 6, N'user961@halk.com'),
(961, 6, N'user962@halk.com'),
(962, 6, N'user963@halk.com'),
(963, 6, N'user964@halk.com'),
(964, 6, N'user965@halk.com'),
(965, 6, N'user966@halk.com'),
(966, 6, N'user967@halk.com'),
(967, 6, N'user968@halk.com'),
(968, 6, N'user969@halk.com'),
(969, 6, N'user970@halk.com'),
(970, 6, N'user971@halk.com'),
(971, 6, N'user972@halk.com'),
(972, 6, N'user973@halk.com'),
(973, 6, N'user974@halk.com'),
(974, 6, N'user975@halk.com'),
(975, 6, N'user976@halk.com'),
(976, 6, N'user977@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (977, 6, N'user978@halk.com'),
(978, 6, N'user979@halk.com'),
(979, 6, N'user980@halk.com'),
(980, 6, N'user981@halk.com'),
(981, 6, N'user982@halk.com'),
(982, 6, N'user983@halk.com'),
(983, 6, N'user984@halk.com'),
(984, 6, N'user985@halk.com'),
(985, 6, N'user986@halk.com'),
(986, 6, N'user987@halk.com'),
(987, 6, N'user988@halk.com'),
(988, 6, N'user989@halk.com'),
(989, 6, N'user990@halk.com'),
(990, 6, N'user991@halk.com'),
(991, 6, N'user992@halk.com'),
(992, 6, N'user993@halk.com'),
(993, 6, N'user994@halk.com'),
(994, 6, N'user995@halk.com'),
(995, 6, N'user996@halk.com'),
(996, 6, N'user997@halk.com'),
(997, 6, N'user998@halk.com'),
(998, 6, N'user999@halk.com'),
(999, 6, N'user1000@halk.com'),
(1000, 6, N'user1001@halk.com'),
(1001, 6, N'user1002@halk.com'),
(1002, 6, N'user1003@halk.com'),
(1003, 6, N'user1004@halk.com'),
(1004, 6, N'user1005@halk.com'),
(1005, 6, N'user1006@halk.com'),
(1006, 6, N'user1007@halk.com'),
(1007, 6, N'user1008@halk.com'),
(1008, 6, N'user1009@halk.com'),
(1009, 6, N'user1010@halk.com'),
(1010, 6, N'user1011@halk.com'),
(1011, 6, N'user1012@halk.com'),
(1012, 6, N'user1013@halk.com'),
(1013, 6, N'user1014@halk.com'),
(1014, 6, N'user1015@halk.com'),
(1015, 6, N'user1016@halk.com'),
(1016, 6, N'user1017@halk.com'),
(1017, 6, N'user1018@halk.com'),
(1018, 6, N'user1019@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1019, 6, N'user1020@halk.com'),
(1020, 6, N'user1021@halk.com'),
(1021, 6, N'user1022@halk.com'),
(1022, 6, N'user1023@halk.com'),
(1023, 6, N'user1024@halk.com'),
(1024, 6, N'user1025@halk.com'),
(1025, 6, N'user1026@halk.com'),
(1026, 6, N'user1027@halk.com'),
(1027, 6, N'user1028@halk.com'),
(1028, 6, N'user1029@halk.com'),
(1029, 6, N'user1030@halk.com'),
(1030, 6, N'user1031@halk.com'),
(1031, 6, N'user1032@halk.com'),
(1032, 6, N'user1033@halk.com'),
(1033, 6, N'user1034@halk.com'),
(1034, 6, N'user1035@halk.com'),
(1035, 6, N'user1036@halk.com'),
(1036, 6, N'user1037@halk.com'),
(1037, 6, N'user1038@halk.com'),
(1038, 6, N'user1039@halk.com'),
(1039, 6, N'user1040@halk.com'),
(1040, 6, N'user1041@halk.com'),
(1041, 6, N'user1042@halk.com'),
(1042, 6, N'user1043@halk.com'),
(1043, 6, N'user1044@halk.com'),
(1044, 6, N'user1045@halk.com'),
(1045, 6, N'user1046@halk.com'),
(1046, 6, N'user1047@halk.com'),
(1047, 6, N'user1048@halk.com'),
(1048, 6, N'user1049@halk.com'),
(1049, 6, N'user1050@halk.com'),
(1050, 6, N'user1051@halk.com'),
(1051, 6, N'user1052@halk.com'),
(1052, 6, N'user1053@halk.com'),
(1053, 6, N'user1054@halk.com'),
(1054, 6, N'user1055@halk.com'),
(1055, 6, N'user1056@halk.com'),
(1056, 6, N'user1057@halk.com'),
(1057, 6, N'user1058@halk.com'),
(1058, 6, N'user1059@halk.com'),
(1059, 6, N'user1060@halk.com'),
(1060, 6, N'user1061@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1061, 6, N'user1062@halk.com'),
(1062, 6, N'user1063@halk.com'),
(1063, 6, N'user1064@halk.com'),
(1064, 6, N'user1065@halk.com'),
(1065, 6, N'user1066@halk.com'),
(1066, 6, N'user1067@halk.com'),
(1067, 6, N'user1068@halk.com'),
(1068, 6, N'user1069@halk.com'),
(1069, 6, N'user1070@halk.com'),
(1070, 6, N'user1071@halk.com'),
(1071, 6, N'user1072@halk.com'),
(1072, 6, N'user1073@halk.com'),
(1073, 6, N'user1074@halk.com'),
(1074, 6, N'user1075@halk.com'),
(1075, 6, N'user1076@halk.com'),
(1076, 6, N'user1077@halk.com'),
(1077, 6, N'user1078@halk.com'),
(1078, 6, N'user1079@halk.com'),
(1079, 6, N'user1080@halk.com'),
(1080, 6, N'user1081@halk.com'),
(1081, 6, N'user1082@halk.com'),
(1082, 6, N'user1083@halk.com'),
(1083, 6, N'user1084@halk.com'),
(1084, 6, N'user1085@halk.com'),
(1085, 6, N'user1086@halk.com'),
(1086, 6, N'user1087@halk.com'),
(1087, 6, N'user1088@halk.com'),
(1088, 6, N'user1089@halk.com'),
(1089, 6, N'user1090@halk.com'),
(1090, 6, N'user1091@halk.com'),
(1091, 6, N'user1092@halk.com'),
(1092, 6, N'user1093@halk.com'),
(1093, 6, N'user1094@halk.com'),
(1094, 6, N'user1095@halk.com'),
(1095, 6, N'user1096@halk.com'),
(1096, 6, N'user1097@halk.com'),
(1097, 6, N'user1098@halk.com'),
(1098, 6, N'user1099@halk.com'),
(1099, 6, N'user1100@halk.com'),
(1100, 6, N'user1101@halk.com'),
(1101, 6, N'user1102@halk.com'),
(1102, 6, N'user1103@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1103, 6, N'user1104@halk.com'),
(1104, 6, N'user1105@halk.com'),
(1105, 6, N'user1106@halk.com'),
(1106, 6, N'user1107@halk.com'),
(1107, 6, N'user1108@halk.com'),
(1108, 6, N'user1109@halk.com'),
(1109, 6, N'user1110@halk.com'),
(1110, 6, N'user1111@halk.com'),
(1111, 6, N'user1112@halk.com'),
(1112, 6, N'user1113@halk.com'),
(1113, 6, N'user1114@halk.com'),
(1114, 6, N'user1115@halk.com'),
(1115, 6, N'user1116@halk.com'),
(1116, 6, N'user1117@halk.com'),
(1117, 6, N'user1118@halk.com'),
(1118, 6, N'user1119@halk.com'),
(1119, 6, N'user1120@halk.com'),
(1120, 6, N'user1121@halk.com'),
(1121, 6, N'user1122@halk.com'),
(1122, 6, N'user1123@halk.com'),
(1123, 6, N'user1124@halk.com'),
(1124, 6, N'user1125@halk.com'),
(1125, 6, N'user1126@halk.com'),
(1126, 6, N'user1127@halk.com'),
(1127, 6, N'user1128@halk.com'),
(1128, 6, N'user1129@halk.com'),
(1129, 6, N'user1130@halk.com'),
(1130, 6, N'user1131@halk.com'),
(1131, 6, N'user1132@halk.com'),
(1132, 6, N'user1133@halk.com'),
(1133, 6, N'user1134@halk.com'),
(1134, 6, N'user1135@halk.com'),
(1135, 6, N'user1136@halk.com'),
(1136, 6, N'user1137@halk.com'),
(1137, 6, N'user1138@halk.com'),
(1138, 6, N'user1139@halk.com'),
(1139, 6, N'user1140@halk.com'),
(1140, 6, N'user1141@halk.com'),
(1141, 6, N'user1142@halk.com'),
(1142, 6, N'user1143@halk.com'),
(1143, 6, N'user1144@halk.com'),
(1144, 6, N'user1145@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1145, 6, N'user1146@halk.com'),
(1146, 6, N'user1147@halk.com'),
(1147, 6, N'user1148@halk.com'),
(1148, 6, N'user1149@halk.com'),
(1149, 6, N'user1150@halk.com'),
(1150, 6, N'user1151@halk.com'),
(1151, 6, N'user1152@halk.com'),
(1152, 6, N'user1153@halk.com'),
(1153, 6, N'user1154@halk.com'),
(1154, 6, N'user1155@halk.com'),
(1155, 6, N'user1156@halk.com'),
(1156, 6, N'user1157@halk.com'),
(1157, 6, N'user1158@halk.com'),
(1158, 6, N'user1159@halk.com'),
(1159, 6, N'user1160@halk.com'),
(1160, 6, N'user1161@halk.com'),
(1161, 6, N'user1162@halk.com'),
(1162, 6, N'user1163@halk.com'),
(1163, 6, N'user1164@halk.com'),
(1164, 6, N'user1165@halk.com'),
(1165, 6, N'user1166@halk.com'),
(1166, 6, N'user1167@halk.com'),
(1167, 6, N'user1168@halk.com'),
(1168, 6, N'user1169@halk.com'),
(1169, 6, N'user1170@halk.com'),
(1170, 6, N'user1171@halk.com'),
(1171, 6, N'user1172@halk.com'),
(1172, 6, N'user1173@halk.com'),
(1173, 6, N'user1174@halk.com'),
(1174, 6, N'user1175@halk.com'),
(1175, 6, N'user1176@halk.com'),
(1176, 6, N'user1177@halk.com'),
(1177, 6, N'user1178@halk.com'),
(1178, 6, N'user1179@halk.com'),
(1179, 6, N'user1180@halk.com'),
(1180, 6, N'user1181@halk.com'),
(1181, 6, N'user1182@halk.com'),
(1182, 6, N'user1183@halk.com'),
(1183, 6, N'user1184@halk.com'),
(1184, 6, N'user1185@halk.com'),
(1185, 6, N'user1186@halk.com'),
(1186, 6, N'user1187@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1187, 6, N'user1188@halk.com'),
(1188, 6, N'user1189@halk.com'),
(1189, 6, N'user1190@halk.com'),
(1190, 6, N'user1191@halk.com'),
(1191, 6, N'user1192@halk.com'),
(1192, 6, N'user1193@halk.com'),
(1193, 6, N'user1194@halk.com'),
(1194, 6, N'user1195@halk.com'),
(1195, 6, N'user1196@halk.com'),
(1196, 6, N'user1197@halk.com'),
(1197, 6, N'user1198@halk.com'),
(1198, 6, N'user1199@halk.com'),
(1199, 6, N'user1200@halk.com'),
(1200, 6, N'user1201@halk.com'),
(1201, 6, N'user1202@halk.com'),
(1202, 6, N'user1203@halk.com'),
(1203, 6, N'user1204@halk.com'),
(1204, 7, N'user1205@halk.com'),
(1205, 7, N'user1206@halk.com'),
(1206, 7, N'user1207@halk.com'),
(1207, 7, N'user1208@halk.com'),
(1208, 7, N'user1209@halk.com'),
(1209, 7, N'user1210@halk.com'),
(1210, 7, N'user1211@halk.com'),
(1211, 7, N'user1212@halk.com'),
(1212, 7, N'user1213@halk.com'),
(1213, 7, N'user1214@halk.com'),
(1214, 7, N'user1215@halk.com'),
(1215, 7, N'user1216@halk.com'),
(1216, 7, N'user1217@halk.com'),
(1217, 7, N'user1218@halk.com'),
(1218, 7, N'user1219@halk.com'),
(1219, 7, N'user1220@halk.com'),
(1220, 7, N'user1221@halk.com'),
(1221, 7, N'user1222@halk.com'),
(1222, 7, N'user1223@halk.com'),
(1223, 7, N'user1224@halk.com'),
(1224, 7, N'user1225@halk.com'),
(1225, 7, N'user1226@halk.com'),
(1226, 7, N'user1227@halk.com'),
(1227, 7, N'user1228@halk.com'),
(1228, 7, N'user1229@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1229, 7, N'user1230@halk.com'),
(1230, 7, N'user1231@halk.com'),
(1231, 7, N'user1232@halk.com'),
(1232, 7, N'user1233@halk.com'),
(1233, 7, N'user1234@halk.com'),
(1234, 7, N'user1235@halk.com'),
(1235, 7, N'user1236@halk.com'),
(1236, 7, N'user1237@halk.com'),
(1237, 7, N'user1238@halk.com'),
(1238, 7, N'user1239@halk.com'),
(1239, 7, N'user1240@halk.com'),
(1240, 7, N'user1241@halk.com'),
(1241, 7, N'user1242@halk.com'),
(1242, 7, N'user1243@halk.com'),
(1243, 7, N'user1244@halk.com'),
(1244, 7, N'user1245@halk.com'),
(1245, 7, N'user1246@halk.com'),
(1246, 7, N'user1247@halk.com'),
(1247, 7, N'user1248@halk.com'),
(1248, 7, N'user1249@halk.com'),
(1249, 7, N'user1250@halk.com'),
(1250, 7, N'user1251@halk.com'),
(1251, 7, N'user1252@halk.com'),
(1252, 7, N'user1253@halk.com'),
(1253, 7, N'user1254@halk.com'),
(1254, 7, N'user1255@halk.com'),
(1255, 7, N'user1256@halk.com'),
(1256, 7, N'user1257@halk.com'),
(1257, 7, N'user1258@halk.com'),
(1258, 7, N'user1259@halk.com'),
(1259, 7, N'user1260@halk.com'),
(1260, 7, N'user1261@halk.com'),
(1261, 7, N'user1262@halk.com'),
(1262, 7, N'user1263@halk.com'),
(1263, 7, N'user1264@halk.com'),
(1264, 7, N'user1265@halk.com'),
(1265, 7, N'user1266@halk.com'),
(1266, 7, N'user1267@halk.com'),
(1267, 7, N'user1268@halk.com'),
(1268, 7, N'user1269@halk.com'),
(1269, 7, N'user1270@halk.com'),
(1270, 7, N'user1271@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1271, 7, N'user1272@halk.com'),
(1272, 7, N'user1273@halk.com'),
(1273, 7, N'user1274@halk.com'),
(1274, 7, N'user1275@halk.com'),
(1275, 7, N'user1276@halk.com'),
(1276, 7, N'user1277@halk.com'),
(1277, 7, N'user1278@halk.com'),
(1278, 7, N'user1279@halk.com'),
(1279, 7, N'user1280@halk.com'),
(1280, 7, N'user1281@halk.com'),
(1281, 7, N'user1282@halk.com'),
(1282, 7, N'user1283@halk.com'),
(1283, 7, N'user1284@halk.com'),
(1284, 7, N'user1285@halk.com'),
(1285, 7, N'user1286@halk.com'),
(1286, 7, N'user1287@halk.com'),
(1287, 7, N'user1288@halk.com'),
(1288, 7, N'user1289@halk.com'),
(1289, 7, N'user1290@halk.com'),
(1290, 7, N'user1291@halk.com'),
(1291, 7, N'user1292@halk.com'),
(1292, 7, N'user1293@halk.com'),
(1293, 7, N'user1294@halk.com'),
(1294, 7, N'user1295@halk.com'),
(1295, 7, N'user1296@halk.com'),
(1296, 7, N'user1297@halk.com'),
(1297, 7, N'user1298@halk.com'),
(1298, 7, N'user1299@halk.com'),
(1299, 7, N'user1300@halk.com'),
(1300, 7, N'user1301@halk.com'),
(1301, 7, N'user1302@halk.com'),
(1302, 7, N'user1303@halk.com'),
(1303, 7, N'user1304@halk.com'),
(1304, 7, N'user1305@halk.com'),
(1305, 7, N'user1306@halk.com'),
(1306, 7, N'user1307@halk.com'),
(1307, 7, N'user1308@halk.com'),
(1308, 7, N'user1309@halk.com'),
(1309, 7, N'user1310@halk.com'),
(1310, 7, N'user1311@halk.com'),
(1311, 7, N'user1312@halk.com'),
(1312, 7, N'user1313@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1313, 7, N'user1314@halk.com'),
(1314, 7, N'user1315@halk.com'),
(1315, 7, N'user1316@halk.com'),
(1316, 7, N'user1317@halk.com'),
(1317, 7, N'user1318@halk.com'),
(1318, 7, N'user1319@halk.com'),
(1319, 7, N'user1320@halk.com'),
(1320, 7, N'user1321@halk.com'),
(1321, 7, N'user1322@halk.com'),
(1322, 7, N'user1323@halk.com'),
(1323, 7, N'user1324@halk.com'),
(1324, 7, N'user1325@halk.com'),
(1325, 7, N'user1326@halk.com'),
(1326, 7, N'user1327@halk.com'),
(1327, 7, N'user1328@halk.com'),
(1328, 7, N'user1329@halk.com'),
(1329, 7, N'user1330@halk.com'),
(1330, 7, N'user1331@halk.com'),
(1331, 7, N'user1332@halk.com'),
(1332, 7, N'user1333@halk.com'),
(1333, 7, N'user1334@halk.com'),
(1334, 7, N'user1335@halk.com'),
(1335, 7, N'user1336@halk.com'),
(1336, 7, N'user1337@halk.com'),
(1337, 7, N'user1338@halk.com'),
(1338, 7, N'user1339@halk.com'),
(1339, 7, N'user1340@halk.com'),
(1340, 7, N'user1341@halk.com'),
(1341, 7, N'user1342@halk.com'),
(1342, 7, N'user1343@halk.com'),
(1343, 7, N'user1344@halk.com'),
(1344, 7, N'user1345@halk.com'),
(1345, 7, N'user1346@halk.com'),
(1346, 7, N'user1347@halk.com'),
(1347, 7, N'user1348@halk.com'),
(1348, 7, N'user1349@halk.com'),
(1349, 7, N'user1350@halk.com'),
(1350, 7, N'user1351@halk.com'),
(1351, 7, N'user1352@halk.com'),
(1352, 7, N'user1353@halk.com'),
(1353, 7, N'user1354@halk.com'),
(1354, 7, N'user1355@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1355, 7, N'user1356@halk.com'),
(1356, 7, N'user1357@halk.com'),
(1357, 7, N'user1358@halk.com'),
(1358, 7, N'user1359@halk.com'),
(1359, 7, N'user1360@halk.com'),
(1360, 8, N'user1361@halk.com'),
(1361, 8, N'user1362@halk.com'),
(1362, 8, N'user1363@halk.com'),
(1363, 8, N'user1364@halk.com'),
(1364, 8, N'user1365@halk.com'),
(1365, 8, N'user1366@halk.com'),
(1366, 8, N'user1367@halk.com'),
(1367, 8, N'user1368@halk.com'),
(1368, 8, N'user1369@halk.com'),
(1369, 8, N'user1370@halk.com'),
(1370, 8, N'user1371@halk.com'),
(1371, 8, N'user1372@halk.com'),
(1372, 8, N'user1373@halk.com'),
(1373, 8, N'user1374@halk.com'),
(1374, 8, N'user1375@halk.com'),
(1375, 8, N'user1376@halk.com'),
(1376, 8, N'user1377@halk.com'),
(1377, 8, N'user1378@halk.com'),
(1378, 8, N'user1379@halk.com'),
(1379, 8, N'user1380@halk.com'),
(1380, 8, N'user1381@halk.com'),
(1381, 8, N'user1382@halk.com'),
(1382, 8, N'user1383@halk.com'),
(1383, 8, N'user1384@halk.com'),
(1384, 8, N'user1385@halk.com'),
(1385, 8, N'user1386@halk.com'),
(1386, 8, N'user1387@halk.com'),
(1387, 8, N'user1388@halk.com'),
(1388, 8, N'user1389@halk.com'),
(1389, 8, N'user1390@halk.com'),
(1390, 8, N'user1391@halk.com'),
(1391, 8, N'user1392@halk.com'),
(1392, 8, N'user1393@halk.com'),
(1393, 8, N'user1394@halk.com'),
(1394, 8, N'user1395@halk.com'),
(1395, 8, N'user1396@halk.com'),
(1396, 8, N'user1397@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1397, 8, N'user1398@halk.com'),
(1398, 8, N'user1399@halk.com'),
(1399, 8, N'user1400@halk.com'),
(1400, 8, N'user1401@halk.com'),
(1401, 8, N'user1402@halk.com'),
(1402, 8, N'user1403@halk.com'),
(1403, 8, N'user1404@halk.com'),
(1404, 8, N'user1405@halk.com'),
(1405, 8, N'user1406@halk.com'),
(1406, 8, N'user1407@halk.com'),
(1407, 8, N'user1408@halk.com'),
(1408, 8, N'user1409@halk.com'),
(1409, 8, N'user1410@halk.com'),
(1410, 8, N'user1411@halk.com'),
(1411, 8, N'user1412@halk.com'),
(1412, 8, N'user1413@halk.com'),
(1413, 8, N'user1414@halk.com'),
(1414, 8, N'user1415@halk.com'),
(1415, 8, N'user1416@halk.com'),
(1416, 8, N'user1417@halk.com'),
(1417, 8, N'user1418@halk.com'),
(1418, 8, N'user1419@halk.com'),
(1419, 8, N'user1420@halk.com'),
(1420, 8, N'user1421@halk.com'),
(1421, 8, N'user1422@halk.com'),
(1422, 8, N'user1423@halk.com'),
(1423, 8, N'user1424@halk.com'),
(1424, 8, N'user1425@halk.com'),
(1425, 8, N'user1426@halk.com'),
(1426, 8, N'user1427@halk.com'),
(1427, 8, N'user1428@halk.com'),
(1428, 8, N'user1429@halk.com'),
(1429, 8, N'user1430@halk.com'),
(1430, 8, N'user1431@halk.com'),
(1431, 8, N'user1432@halk.com'),
(1432, 8, N'user1433@halk.com'),
(1433, 8, N'user1434@halk.com'),
(1434, 8, N'user1435@halk.com'),
(1435, 8, N'user1436@halk.com'),
(1436, 8, N'user1437@halk.com'),
(1437, 8, N'user1438@halk.com'),
(1438, 8, N'user1439@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1439, 8, N'user1440@halk.com'),
(1440, 8, N'user1441@halk.com'),
(1441, 8, N'user1442@halk.com'),
(1442, 8, N'user1443@halk.com'),
(1443, 8, N'user1444@halk.com'),
(1444, 8, N'user1445@halk.com'),
(1445, 8, N'user1446@halk.com'),
(1446, 8, N'user1447@halk.com'),
(1447, 8, N'user1448@halk.com'),
(1448, 8, N'user1449@halk.com'),
(1449, 8, N'user1450@halk.com'),
(1450, 8, N'user1451@halk.com'),
(1451, 8, N'user1452@halk.com'),
(1452, 8, N'user1453@halk.com'),
(1453, 8, N'user1454@halk.com'),
(1454, 8, N'user1455@halk.com'),
(1455, 8, N'user1456@halk.com'),
(1456, 8, N'user1457@halk.com'),
(1457, 8, N'user1458@halk.com'),
(1458, 8, N'user1459@halk.com'),
(1459, 8, N'user1460@halk.com'),
(1460, 8, N'user1461@halk.com'),
(1461, 8, N'user1462@halk.com'),
(1462, 8, N'user1463@halk.com'),
(1463, 8, N'user1464@halk.com'),
(1464, 8, N'user1465@halk.com'),
(1465, 8, N'user1466@halk.com'),
(1466, 8, N'user1467@halk.com'),
(1467, 8, N'user1468@halk.com'),
(1468, 8, N'user1469@halk.com'),
(1469, 8, N'user1470@halk.com'),
(1470, 8, N'user1471@halk.com'),
(1471, 8, N'user1472@halk.com'),
(1472, 8, N'user1473@halk.com'),
(1473, 8, N'user1474@halk.com'),
(1474, 8, N'user1475@halk.com'),
(1475, 8, N'user1476@halk.com'),
(1476, 8, N'user1477@halk.com'),
(1477, 8, N'user1478@halk.com'),
(1478, 8, N'user1479@halk.com'),
(1479, 8, N'user1480@halk.com'),
(1480, 8, N'user1481@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1481, 8, N'user1482@halk.com'),
(1482, 8, N'user1483@halk.com'),
(1483, 8, N'user1484@halk.com'),
(1484, 8, N'user1485@halk.com'),
(1485, 8, N'user1486@halk.com'),
(1486, 8, N'user1487@halk.com'),
(1487, 8, N'user1488@halk.com'),
(1488, 8, N'user1489@halk.com'),
(1489, 8, N'user1490@halk.com'),
(1490, 8, N'user1491@halk.com'),
(1491, 8, N'user1492@halk.com'),
(1492, 8, N'user1493@halk.com'),
(1493, 8, N'user1494@halk.com'),
(1494, 8, N'user1495@halk.com'),
(1495, 8, N'user1496@halk.com'),
(1496, 8, N'user1497@halk.com'),
(1497, 8, N'user1498@halk.com'),
(1498, 8, N'user1499@halk.com'),
(1499, 8, N'user1500@halk.com'),
(1500, 8, N'user1501@halk.com'),
(1501, 8, N'user1502@halk.com'),
(1502, 8, N'user1503@halk.com'),
(1503, 8, N'user1504@halk.com'),
(1504, 8, N'user1505@halk.com'),
(1505, 8, N'user1506@halk.com'),
(1506, 8, N'user1507@halk.com'),
(1507, 8, N'user1508@halk.com'),
(1508, 8, N'user1509@halk.com'),
(1509, 8, N'user1510@halk.com'),
(1510, 8, N'user1511@halk.com'),
(1511, 8, N'user1512@halk.com'),
(1512, 8, N'user1513@halk.com'),
(1513, 8, N'user1514@halk.com'),
(1514, 8, N'user1515@halk.com'),
(1515, 8, N'user1516@halk.com'),
(1516, 8, N'user1517@halk.com'),
(1517, 8, N'user1518@halk.com'),
(1518, 8, N'user1519@halk.com'),
(1519, 8, N'user1520@halk.com'),
(1520, 8, N'user1521@halk.com'),
(1521, 8, N'user1522@halk.com'),
(1522, 8, N'user1523@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1523, 8, N'user1524@halk.com'),
(1524, 8, N'user1525@halk.com'),
(1525, 8, N'user1526@halk.com'),
(1526, 8, N'user1527@halk.com'),
(1527, 8, N'user1528@halk.com'),
(1528, 8, N'user1529@halk.com'),
(1529, 8, N'user1530@halk.com'),
(1530, 8, N'user1531@halk.com'),
(1531, 8, N'user1532@halk.com'),
(1532, 8, N'user1533@halk.com'),
(1533, 8, N'user1534@halk.com'),
(1534, 8, N'user1535@halk.com'),
(1535, 8, N'user1536@halk.com'),
(1536, 8, N'user1537@halk.com'),
(1537, 8, N'user1538@halk.com'),
(1538, 8, N'user1539@halk.com'),
(1539, 8, N'user1540@halk.com'),
(1540, 8, N'user1541@halk.com'),
(1541, 8, N'user1542@halk.com'),
(1542, 8, N'user1543@halk.com'),
(1543, 8, N'user1544@halk.com'),
(1544, 8, N'user1545@halk.com'),
(1545, 8, N'user1546@halk.com'),
(1546, 8, N'user1547@halk.com'),
(1547, 8, N'user1548@halk.com'),
(1548, 8, N'user1549@halk.com'),
(1549, 8, N'user1550@halk.com'),
(1550, 8, N'user1551@halk.com'),
(1551, 8, N'user1552@halk.com'),
(1552, 8, N'user1553@halk.com'),
(1553, 8, N'user1554@halk.com'),
(1554, 8, N'user1555@halk.com'),
(1555, 8, N'user1556@halk.com'),
(1556, 8, N'user1557@halk.com'),
(1557, 8, N'user1558@halk.com'),
(1558, 8, N'user1559@halk.com'),
(1559, 8, N'user1560@halk.com'),
(1560, 8, N'user1561@halk.com'),
(1561, 8, N'user1562@halk.com'),
(1562, 8, N'user1563@halk.com'),
(1563, 8, N'user1564@halk.com'),
(1564, 8, N'user1565@halk.com');
INSERT INTO [NewsLikes] ([Id], [NewsId], [UserEmail])
VALUES (1565, 8, N'user1566@halk.com'),
(1566, 8, N'user1567@halk.com'),
(1567, 8, N'user1568@halk.com'),
(1568, 8, N'user1569@halk.com'),
(1569, 8, N'user1570@halk.com'),
(1570, 8, N'user1571@halk.com'),
(1571, 8, N'user1572@halk.com'),
(1572, 8, N'user1573@halk.com'),
(1573, 8, N'user1574@halk.com'),
(1574, 8, N'user1575@halk.com'),
(1575, 8, N'user1576@halk.com'),
(1576, 8, N'user1577@halk.com'),
(1577, 8, N'user1578@halk.com'),
(1578, 8, N'user1579@halk.com'),
(1579, 8, N'user1580@halk.com'),
(1580, 8, N'user1581@halk.com'),
(1581, 8, N'user1582@halk.com'),
(1582, 8, N'user1583@halk.com'),
(1583, 8, N'user1584@halk.com'),
(1584, 8, N'user1585@halk.com'),
(1585, 8, N'user1586@halk.com'),
(1586, 8, N'user1587@halk.com'),
(1587, 8, N'user1588@halk.com'),
(1588, 8, N'user1589@halk.com'),
(1589, 8, N'user1590@halk.com'),
(1590, 8, N'user1591@halk.com'),
(1591, 8, N'user1592@halk.com'),
(1592, 8, N'user1593@halk.com'),
(1593, 8, N'user1594@halk.com'),
(1594, 8, N'user1595@halk.com'),
(1595, 8, N'user1596@halk.com'),
(1596, 8, N'user1597@halk.com'),
(1597, 8, N'user1598@halk.com'),
(1598, 8, N'user1599@halk.com'),
(1599, 8, N'user1600@halk.com'),
(1600, 8, N'user1601@halk.com'),
(1601, 8, N'user1602@halk.com'),
(1602, 8, N'user1603@halk.com'),
(1603, 8, N'user1604@halk.com'),
(1604, 8, N'user1605@halk.com');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'NewsId', N'UserEmail') AND [object_id] = OBJECT_ID(N'[NewsLikes]'))
    SET IDENTITY_INSERT [NewsLikes] OFF;

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260502154633_MassiveSocialUpdate', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
CREATE TABLE [LibraryBooks] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [Author] nvarchar(max) NOT NULL,
    [Category] nvarchar(max) NULL,
    [CoverImageUrl] nvarchar(max) NULL,
    [PdfUrl] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [PositionX] real NOT NULL,
    [PositionY] real NOT NULL,
    [PositionZ] real NOT NULL,
    [RotationY] real NOT NULL,
    CONSTRAINT [PK_LibraryBooks] PRIMARY KEY ([Id])
);

CREATE TABLE [LibraryBookPages] (
    [Id] int NOT NULL IDENTITY,
    [LibraryBookId] int NOT NULL,
    [PageNumber] int NOT NULL,
    [ImageUrl] nvarchar(max) NULL,
    [TextContent] nvarchar(max) NULL,
    CONSTRAINT [PK_LibraryBookPages] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_LibraryBookPages_LibraryBooks_LibraryBookId] FOREIGN KEY ([LibraryBookId]) REFERENCES [LibraryBooks] ([Id]) ON DELETE CASCADE
);

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T12:42:16.6212676+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T12:42:16.6217495+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T12:42:16.6217511+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T12:42:16.6217518+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T12:42:16.6217523+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T12:42:16.6217527+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6267518+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6267996+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6268295+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6268299+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6268793+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6268806+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6269092+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6269095+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6269366+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6269372+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6269855+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6269857+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6270051+03:00'
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6270053+03:00'
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6270280+03:00'
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6270282+03:00'
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6270852+03:00'
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6270863+03:00'
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6271067+03:00'
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6271069+03:00'
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6271265+03:00'
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6271267+03:00'
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T12:42:16.6271620+03:00'
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T12:42:16.6271623+03:00'
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6203067+03:00', [ImageUrl] = N'/images/news/python_course.png'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205140+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205148+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205153+03:00', [ImageUrl] = N'/images/exhibition/ebru.png'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205157+03:00', [ImageUrl] = N'/images/news/gastronomy.png'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205160+03:00', [ImageUrl] = N'/images/news/speaking_club.png'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205163+03:00', [ImageUrl] = N'/images/news/certificate_ceremony.png'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205167+03:00', [ImageUrl] = N'/images/exhibition/ebru.png'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205170+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205173+03:00', [ImageUrl] = N'/images/news/entrepreneurship.png'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205176+03:00', [ImageUrl] = N'/images/exhibition/robotics.png'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T12:42:16.6205179+03:00', [ImageUrl] = N'/images/news/gastronomy.png'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6262904+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264573+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264585+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264588+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264591+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264598+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264602+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264606+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264608+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264618+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264622+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264624+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264628+03:00'
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264631+03:00'
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264634+03:00'
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264637+03:00'
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264640+03:00'
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264644+03:00'
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264646+03:00'
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264649+03:00'
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264651+03:00'
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264653+03:00'
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264656+03:00'
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264658+03:00'
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264660+03:00'
WHERE [Id] = 25;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264663+03:00'
WHERE [Id] = 26;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264665+03:00'
WHERE [Id] = 27;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264667+03:00'
WHERE [Id] = 28;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264669+03:00'
WHERE [Id] = 29;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264672+03:00'
WHERE [Id] = 30;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264695+03:00'
WHERE [Id] = 31;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264698+03:00'
WHERE [Id] = 32;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264702+03:00'
WHERE [Id] = 33;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264707+03:00'
WHERE [Id] = 34;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264710+03:00'
WHERE [Id] = 35;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264712+03:00'
WHERE [Id] = 36;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264714+03:00'
WHERE [Id] = 37;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264717+03:00'
WHERE [Id] = 38;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264719+03:00'
WHERE [Id] = 39;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264721+03:00'
WHERE [Id] = 40;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264723+03:00'
WHERE [Id] = 41;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264726+03:00'
WHERE [Id] = 42;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264728+03:00'
WHERE [Id] = 43;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264730+03:00'
WHERE [Id] = 44;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264732+03:00'
WHERE [Id] = 45;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264735+03:00'
WHERE [Id] = 46;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264737+03:00'
WHERE [Id] = 47;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264739+03:00'
WHERE [Id] = 48;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264741+03:00'
WHERE [Id] = 49;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264745+03:00'
WHERE [Id] = 50;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264747+03:00'
WHERE [Id] = 51;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264749+03:00'
WHERE [Id] = 52;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264751+03:00'
WHERE [Id] = 53;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264754+03:00'
WHERE [Id] = 54;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264756+03:00'
WHERE [Id] = 55;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264758+03:00'
WHERE [Id] = 56;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264761+03:00'
WHERE [Id] = 57;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264763+03:00'
WHERE [Id] = 58;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264765+03:00'
WHERE [Id] = 59;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264767+03:00'
WHERE [Id] = 60;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264770+03:00'
WHERE [Id] = 61;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264772+03:00'
WHERE [Id] = 62;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264774+03:00'
WHERE [Id] = 63;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264776+03:00'
WHERE [Id] = 64;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264780+03:00'
WHERE [Id] = 65;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264784+03:00'
WHERE [Id] = 66;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264786+03:00'
WHERE [Id] = 67;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264789+03:00'
WHERE [Id] = 68;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264791+03:00'
WHERE [Id] = 69;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264793+03:00'
WHERE [Id] = 70;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264796+03:00'
WHERE [Id] = 71;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264798+03:00'
WHERE [Id] = 72;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264800+03:00'
WHERE [Id] = 73;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264802+03:00'
WHERE [Id] = 74;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264805+03:00'
WHERE [Id] = 75;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264807+03:00'
WHERE [Id] = 76;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264809+03:00'
WHERE [Id] = 77;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264811+03:00'
WHERE [Id] = 78;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264814+03:00'
WHERE [Id] = 79;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264816+03:00'
WHERE [Id] = 80;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264819+03:00'
WHERE [Id] = 81;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264821+03:00'
WHERE [Id] = 82;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264824+03:00'
WHERE [Id] = 83;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264826+03:00'
WHERE [Id] = 84;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264828+03:00'
WHERE [Id] = 85;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264830+03:00'
WHERE [Id] = 86;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264833+03:00'
WHERE [Id] = 87;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264835+03:00'
WHERE [Id] = 88;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264837+03:00'
WHERE [Id] = 89;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264840+03:00'
WHERE [Id] = 90;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264842+03:00'
WHERE [Id] = 91;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264844+03:00'
WHERE [Id] = 92;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264846+03:00'
WHERE [Id] = 93;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264849+03:00'
WHERE [Id] = 94;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264870+03:00'
WHERE [Id] = 95;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264873+03:00'
WHERE [Id] = 96;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264876+03:00'
WHERE [Id] = 97;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264878+03:00'
WHERE [Id] = 98;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264880+03:00'
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264883+03:00'
WHERE [Id] = 100;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264885+03:00'
WHERE [Id] = 101;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264888+03:00'
WHERE [Id] = 102;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264890+03:00'
WHERE [Id] = 103;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264892+03:00'
WHERE [Id] = 104;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264894+03:00'
WHERE [Id] = 105;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264897+03:00'
WHERE [Id] = 106;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264899+03:00'
WHERE [Id] = 107;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264901+03:00'
WHERE [Id] = 108;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264903+03:00'
WHERE [Id] = 109;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264906+03:00'
WHERE [Id] = 110;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264908+03:00'
WHERE [Id] = 111;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6264911+03:00'
WHERE [Id] = 112;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268001+03:00'
WHERE [Id] = 113;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268007+03:00'
WHERE [Id] = 114;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268010+03:00'
WHERE [Id] = 115;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268013+03:00'
WHERE [Id] = 116;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268017+03:00'
WHERE [Id] = 117;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268019+03:00'
WHERE [Id] = 118;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268022+03:00'
WHERE [Id] = 119;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268026+03:00'
WHERE [Id] = 120;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268030+03:00'
WHERE [Id] = 121;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268033+03:00'
WHERE [Id] = 122;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268037+03:00'
WHERE [Id] = 123;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268040+03:00'
WHERE [Id] = 124;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268043+03:00'
WHERE [Id] = 125;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268045+03:00'
WHERE [Id] = 126;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268049+03:00'
WHERE [Id] = 127;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268051+03:00'
WHERE [Id] = 128;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268053+03:00'
WHERE [Id] = 129;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268059+03:00'
WHERE [Id] = 130;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268062+03:00'
WHERE [Id] = 131;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268064+03:00'
WHERE [Id] = 132;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268066+03:00'
WHERE [Id] = 133;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268068+03:00'
WHERE [Id] = 134;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268071+03:00'
WHERE [Id] = 135;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268073+03:00'
WHERE [Id] = 136;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268075+03:00'
WHERE [Id] = 137;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268078+03:00'
WHERE [Id] = 138;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268080+03:00'
WHERE [Id] = 139;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268082+03:00'
WHERE [Id] = 140;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268084+03:00'
WHERE [Id] = 141;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268088+03:00'
WHERE [Id] = 142;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268090+03:00'
WHERE [Id] = 143;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268092+03:00'
WHERE [Id] = 144;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268094+03:00'
WHERE [Id] = 145;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268097+03:00'
WHERE [Id] = 146;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268099+03:00'
WHERE [Id] = 147;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268101+03:00'
WHERE [Id] = 148;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268103+03:00'
WHERE [Id] = 149;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268106+03:00'
WHERE [Id] = 150;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268118+03:00'
WHERE [Id] = 151;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268121+03:00'
WHERE [Id] = 152;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268124+03:00'
WHERE [Id] = 153;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268126+03:00'
WHERE [Id] = 154;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268129+03:00'
WHERE [Id] = 155;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268131+03:00'
WHERE [Id] = 156;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268133+03:00'
WHERE [Id] = 157;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268136+03:00'
WHERE [Id] = 158;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268138+03:00'
WHERE [Id] = 159;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268140+03:00'
WHERE [Id] = 160;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268142+03:00'
WHERE [Id] = 161;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268145+03:00'
WHERE [Id] = 162;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268147+03:00'
WHERE [Id] = 163;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268149+03:00'
WHERE [Id] = 164;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268152+03:00'
WHERE [Id] = 165;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268154+03:00'
WHERE [Id] = 166;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268156+03:00'
WHERE [Id] = 167;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268158+03:00'
WHERE [Id] = 168;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268161+03:00'
WHERE [Id] = 169;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268164+03:00'
WHERE [Id] = 170;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268166+03:00'
WHERE [Id] = 171;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268168+03:00'
WHERE [Id] = 172;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268171+03:00'
WHERE [Id] = 173;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268173+03:00'
WHERE [Id] = 174;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268175+03:00'
WHERE [Id] = 175;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268177+03:00'
WHERE [Id] = 176;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268180+03:00'
WHERE [Id] = 177;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268182+03:00'
WHERE [Id] = 178;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268184+03:00'
WHERE [Id] = 179;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268186+03:00'
WHERE [Id] = 180;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268189+03:00'
WHERE [Id] = 181;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268191+03:00'
WHERE [Id] = 182;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268193+03:00'
WHERE [Id] = 183;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268196+03:00'
WHERE [Id] = 184;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268198+03:00'
WHERE [Id] = 185;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268201+03:00'
WHERE [Id] = 186;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268204+03:00'
WHERE [Id] = 187;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268206+03:00'
WHERE [Id] = 188;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268208+03:00'
WHERE [Id] = 189;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268211+03:00'
WHERE [Id] = 190;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268213+03:00'
WHERE [Id] = 191;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268215+03:00'
WHERE [Id] = 192;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268218+03:00'
WHERE [Id] = 193;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268220+03:00'
WHERE [Id] = 194;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268222+03:00'
WHERE [Id] = 195;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268225+03:00'
WHERE [Id] = 196;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268227+03:00'
WHERE [Id] = 197;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268229+03:00'
WHERE [Id] = 198;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268231+03:00'
WHERE [Id] = 199;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268234+03:00'
WHERE [Id] = 200;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268236+03:00'
WHERE [Id] = 201;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268238+03:00'
WHERE [Id] = 202;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268240+03:00'
WHERE [Id] = 203;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268243+03:00'
WHERE [Id] = 204;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268245+03:00'
WHERE [Id] = 205;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268248+03:00'
WHERE [Id] = 206;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268251+03:00'
WHERE [Id] = 207;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268253+03:00'
WHERE [Id] = 208;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268255+03:00'
WHERE [Id] = 209;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268258+03:00'
WHERE [Id] = 210;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268260+03:00'
WHERE [Id] = 211;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268262+03:00'
WHERE [Id] = 212;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268264+03:00'
WHERE [Id] = 213;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268267+03:00'
WHERE [Id] = 214;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268269+03:00'
WHERE [Id] = 215;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268271+03:00'
WHERE [Id] = 216;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268273+03:00'
WHERE [Id] = 217;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268276+03:00'
WHERE [Id] = 218;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268278+03:00'
WHERE [Id] = 219;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268280+03:00'
WHERE [Id] = 220;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268283+03:00'
WHERE [Id] = 221;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268285+03:00'
WHERE [Id] = 222;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268288+03:00'
WHERE [Id] = 223;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268290+03:00'
WHERE [Id] = 224;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268301+03:00'
WHERE [Id] = 225;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268303+03:00'
WHERE [Id] = 226;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268306+03:00'
WHERE [Id] = 227;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268320+03:00'
WHERE [Id] = 228;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268322+03:00'
WHERE [Id] = 229;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268324+03:00'
WHERE [Id] = 230;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268327+03:00'
WHERE [Id] = 231;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268329+03:00'
WHERE [Id] = 232;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268331+03:00'
WHERE [Id] = 233;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268334+03:00'
WHERE [Id] = 234;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268336+03:00'
WHERE [Id] = 235;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268338+03:00'
WHERE [Id] = 236;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268340+03:00'
WHERE [Id] = 237;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268343+03:00'
WHERE [Id] = 238;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268345+03:00'
WHERE [Id] = 239;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268347+03:00'
WHERE [Id] = 240;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268350+03:00'
WHERE [Id] = 241;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268353+03:00'
WHERE [Id] = 242;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268355+03:00'
WHERE [Id] = 243;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268357+03:00'
WHERE [Id] = 244;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268360+03:00'
WHERE [Id] = 245;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268362+03:00'
WHERE [Id] = 246;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268364+03:00'
WHERE [Id] = 247;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268366+03:00'
WHERE [Id] = 248;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268369+03:00'
WHERE [Id] = 249;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268371+03:00'
WHERE [Id] = 250;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268373+03:00'
WHERE [Id] = 251;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268375+03:00'
WHERE [Id] = 252;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268378+03:00'
WHERE [Id] = 253;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268380+03:00'
WHERE [Id] = 254;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268382+03:00'
WHERE [Id] = 255;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268385+03:00'
WHERE [Id] = 256;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268388+03:00'
WHERE [Id] = 257;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268394+03:00'
WHERE [Id] = 258;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268396+03:00'
WHERE [Id] = 259;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268399+03:00'
WHERE [Id] = 260;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268401+03:00'
WHERE [Id] = 261;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268403+03:00'
WHERE [Id] = 262;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268405+03:00'
WHERE [Id] = 263;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268408+03:00'
WHERE [Id] = 264;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268410+03:00'
WHERE [Id] = 265;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268412+03:00'
WHERE [Id] = 266;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268421+03:00'
WHERE [Id] = 267;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268424+03:00'
WHERE [Id] = 268;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268427+03:00'
WHERE [Id] = 269;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268429+03:00'
WHERE [Id] = 270;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268431+03:00'
WHERE [Id] = 271;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268433+03:00'
WHERE [Id] = 272;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268436+03:00'
WHERE [Id] = 273;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268439+03:00'
WHERE [Id] = 274;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268441+03:00'
WHERE [Id] = 275;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268443+03:00'
WHERE [Id] = 276;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268445+03:00'
WHERE [Id] = 277;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268448+03:00'
WHERE [Id] = 278;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268450+03:00'
WHERE [Id] = 279;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268452+03:00'
WHERE [Id] = 280;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268454+03:00'
WHERE [Id] = 281;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268457+03:00'
WHERE [Id] = 282;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268459+03:00'
WHERE [Id] = 283;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268461+03:00'
WHERE [Id] = 284;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268464+03:00'
WHERE [Id] = 285;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268466+03:00'
WHERE [Id] = 286;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268468+03:00'
WHERE [Id] = 287;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268470+03:00'
WHERE [Id] = 288;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268473+03:00'
WHERE [Id] = 289;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268476+03:00'
WHERE [Id] = 290;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268478+03:00'
WHERE [Id] = 291;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268480+03:00'
WHERE [Id] = 292;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268482+03:00'
WHERE [Id] = 293;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268485+03:00'
WHERE [Id] = 294;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268487+03:00'
WHERE [Id] = 295;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268489+03:00'
WHERE [Id] = 296;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268492+03:00'
WHERE [Id] = 297;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268494+03:00'
WHERE [Id] = 298;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268496+03:00'
WHERE [Id] = 299;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268498+03:00'
WHERE [Id] = 300;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268501+03:00'
WHERE [Id] = 301;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268503+03:00'
WHERE [Id] = 302;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268505+03:00'
WHERE [Id] = 303;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268507+03:00'
WHERE [Id] = 304;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268510+03:00'
WHERE [Id] = 305;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268513+03:00'
WHERE [Id] = 306;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268515+03:00'
WHERE [Id] = 307;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268517+03:00'
WHERE [Id] = 308;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268519+03:00'
WHERE [Id] = 309;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268522+03:00'
WHERE [Id] = 310;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268524+03:00'
WHERE [Id] = 311;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268526+03:00'
WHERE [Id] = 312;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268529+03:00'
WHERE [Id] = 313;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268531+03:00'
WHERE [Id] = 314;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268533+03:00'
WHERE [Id] = 315;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268535+03:00'
WHERE [Id] = 316;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268538+03:00'
WHERE [Id] = 317;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268540+03:00'
WHERE [Id] = 318;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268542+03:00'
WHERE [Id] = 319;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268544+03:00'
WHERE [Id] = 320;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268548+03:00'
WHERE [Id] = 321;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268550+03:00'
WHERE [Id] = 322;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268552+03:00'
WHERE [Id] = 323;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268554+03:00'
WHERE [Id] = 324;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268557+03:00'
WHERE [Id] = 325;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268559+03:00'
WHERE [Id] = 326;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268561+03:00'
WHERE [Id] = 327;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268563+03:00'
WHERE [Id] = 328;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268566+03:00'
WHERE [Id] = 329;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268568+03:00'
WHERE [Id] = 330;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268570+03:00'
WHERE [Id] = 331;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268572+03:00'
WHERE [Id] = 332;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268575+03:00'
WHERE [Id] = 333;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268577+03:00'
WHERE [Id] = 334;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268579+03:00'
WHERE [Id] = 335;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268582+03:00'
WHERE [Id] = 336;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268585+03:00'
WHERE [Id] = 337;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268587+03:00'
WHERE [Id] = 338;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268589+03:00'
WHERE [Id] = 339;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268592+03:00'
WHERE [Id] = 340;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268594+03:00'
WHERE [Id] = 341;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268597+03:00'
WHERE [Id] = 342;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268600+03:00'
WHERE [Id] = 343;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268602+03:00'
WHERE [Id] = 344;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268604+03:00'
WHERE [Id] = 345;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268614+03:00'
WHERE [Id] = 346;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268616+03:00'
WHERE [Id] = 347;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268619+03:00'
WHERE [Id] = 348;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268621+03:00'
WHERE [Id] = 349;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268623+03:00'
WHERE [Id] = 350;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268625+03:00'
WHERE [Id] = 351;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268628+03:00'
WHERE [Id] = 352;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268630+03:00'
WHERE [Id] = 353;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268632+03:00'
WHERE [Id] = 354;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268634+03:00'
WHERE [Id] = 355;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268637+03:00'
WHERE [Id] = 356;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268640+03:00'
WHERE [Id] = 357;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268642+03:00'
WHERE [Id] = 358;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268644+03:00'
WHERE [Id] = 359;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268646+03:00'
WHERE [Id] = 360;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268649+03:00'
WHERE [Id] = 361;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268651+03:00'
WHERE [Id] = 362;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268653+03:00'
WHERE [Id] = 363;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268655+03:00'
WHERE [Id] = 364;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268658+03:00'
WHERE [Id] = 365;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268660+03:00'
WHERE [Id] = 366;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268662+03:00'
WHERE [Id] = 367;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268664+03:00'
WHERE [Id] = 368;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268667+03:00'
WHERE [Id] = 369;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268669+03:00'
WHERE [Id] = 370;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268671+03:00'
WHERE [Id] = 371;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268673+03:00'
WHERE [Id] = 372;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268676+03:00'
WHERE [Id] = 373;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268679+03:00'
WHERE [Id] = 374;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268681+03:00'
WHERE [Id] = 375;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268683+03:00'
WHERE [Id] = 376;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268685+03:00'
WHERE [Id] = 377;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268688+03:00'
WHERE [Id] = 378;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268691+03:00'
WHERE [Id] = 379;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268693+03:00'
WHERE [Id] = 380;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268695+03:00'
WHERE [Id] = 381;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268697+03:00'
WHERE [Id] = 382;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268700+03:00'
WHERE [Id] = 383;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268702+03:00'
WHERE [Id] = 384;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268704+03:00'
WHERE [Id] = 385;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268706+03:00'
WHERE [Id] = 386;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268709+03:00'
WHERE [Id] = 387;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268711+03:00'
WHERE [Id] = 388;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268713+03:00'
WHERE [Id] = 389;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268715+03:00'
WHERE [Id] = 390;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268718+03:00'
WHERE [Id] = 391;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268720+03:00'
WHERE [Id] = 392;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268722+03:00'
WHERE [Id] = 393;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268725+03:00'
WHERE [Id] = 394;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268727+03:00'
WHERE [Id] = 395;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268730+03:00'
WHERE [Id] = 396;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268732+03:00'
WHERE [Id] = 397;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268734+03:00'
WHERE [Id] = 398;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268736+03:00'
WHERE [Id] = 399;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268739+03:00'
WHERE [Id] = 400;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268741+03:00'
WHERE [Id] = 401;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268743+03:00'
WHERE [Id] = 402;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268745+03:00'
WHERE [Id] = 403;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268748+03:00'
WHERE [Id] = 404;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268750+03:00'
WHERE [Id] = 405;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268752+03:00'
WHERE [Id] = 406;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268754+03:00'
WHERE [Id] = 407;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268757+03:00'
WHERE [Id] = 408;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268759+03:00'
WHERE [Id] = 409;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268762+03:00'
WHERE [Id] = 410;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268764+03:00'
WHERE [Id] = 411;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268767+03:00'
WHERE [Id] = 412;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268769+03:00'
WHERE [Id] = 413;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268771+03:00'
WHERE [Id] = 414;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268773+03:00'
WHERE [Id] = 415;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268776+03:00'
WHERE [Id] = 416;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268778+03:00'
WHERE [Id] = 417;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268780+03:00'
WHERE [Id] = 418;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268782+03:00'
WHERE [Id] = 419;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268785+03:00'
WHERE [Id] = 420;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268787+03:00'
WHERE [Id] = 421;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268789+03:00'
WHERE [Id] = 422;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268807+03:00'
WHERE [Id] = 423;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268810+03:00'
WHERE [Id] = 424;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268812+03:00'
WHERE [Id] = 425;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268814+03:00'
WHERE [Id] = 426;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268817+03:00'
WHERE [Id] = 427;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268819+03:00'
WHERE [Id] = 428;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268821+03:00'
WHERE [Id] = 429;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268823+03:00'
WHERE [Id] = 430;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268826+03:00'
WHERE [Id] = 431;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268828+03:00'
WHERE [Id] = 432;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268830+03:00'
WHERE [Id] = 433;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268832+03:00'
WHERE [Id] = 434;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268835+03:00'
WHERE [Id] = 435;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268837+03:00'
WHERE [Id] = 436;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268839+03:00'
WHERE [Id] = 437;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268841+03:00'
WHERE [Id] = 438;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268845+03:00'
WHERE [Id] = 439;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268847+03:00'
WHERE [Id] = 440;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268849+03:00'
WHERE [Id] = 441;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268851+03:00'
WHERE [Id] = 442;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268854+03:00'
WHERE [Id] = 443;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268856+03:00'
WHERE [Id] = 444;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268858+03:00'
WHERE [Id] = 445;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268860+03:00'
WHERE [Id] = 446;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268863+03:00'
WHERE [Id] = 447;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268865+03:00'
WHERE [Id] = 448;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268867+03:00'
WHERE [Id] = 449;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268869+03:00'
WHERE [Id] = 450;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268872+03:00'
WHERE [Id] = 451;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268874+03:00'
WHERE [Id] = 452;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268876+03:00'
WHERE [Id] = 453;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268878+03:00'
WHERE [Id] = 454;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268882+03:00'
WHERE [Id] = 455;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268884+03:00'
WHERE [Id] = 456;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268886+03:00'
WHERE [Id] = 457;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268888+03:00'
WHERE [Id] = 458;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268891+03:00'
WHERE [Id] = 459;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268893+03:00'
WHERE [Id] = 460;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268895+03:00'
WHERE [Id] = 461;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268897+03:00'
WHERE [Id] = 462;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268900+03:00'
WHERE [Id] = 463;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268902+03:00'
WHERE [Id] = 464;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268904+03:00'
WHERE [Id] = 465;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268906+03:00'
WHERE [Id] = 466;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268909+03:00'
WHERE [Id] = 467;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268911+03:00'
WHERE [Id] = 468;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268914+03:00'
WHERE [Id] = 469;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268916+03:00'
WHERE [Id] = 470;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268918+03:00'
WHERE [Id] = 471;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268920+03:00'
WHERE [Id] = 472;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268923+03:00'
WHERE [Id] = 473;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268925+03:00'
WHERE [Id] = 474;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268927+03:00'
WHERE [Id] = 475;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268929+03:00'
WHERE [Id] = 476;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268932+03:00'
WHERE [Id] = 477;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268934+03:00'
WHERE [Id] = 478;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268936+03:00'
WHERE [Id] = 479;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268939+03:00'
WHERE [Id] = 480;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268941+03:00'
WHERE [Id] = 481;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268943+03:00'
WHERE [Id] = 482;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268945+03:00'
WHERE [Id] = 483;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268948+03:00'
WHERE [Id] = 484;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268950+03:00'
WHERE [Id] = 485;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268953+03:00'
WHERE [Id] = 486;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268955+03:00'
WHERE [Id] = 487;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268957+03:00'
WHERE [Id] = 488;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268960+03:00'
WHERE [Id] = 489;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268962+03:00'
WHERE [Id] = 490;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268964+03:00'
WHERE [Id] = 491;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268966+03:00'
WHERE [Id] = 492;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268969+03:00'
WHERE [Id] = 493;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268971+03:00'
WHERE [Id] = 494;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268973+03:00'
WHERE [Id] = 495;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268975+03:00'
WHERE [Id] = 496;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268978+03:00'
WHERE [Id] = 497;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268980+03:00'
WHERE [Id] = 498;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268982+03:00'
WHERE [Id] = 499;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268994+03:00'
WHERE [Id] = 500;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6268997+03:00'
WHERE [Id] = 501;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269000+03:00'
WHERE [Id] = 502;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269002+03:00'
WHERE [Id] = 503;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269005+03:00'
WHERE [Id] = 504;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269007+03:00'
WHERE [Id] = 505;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269009+03:00'
WHERE [Id] = 506;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269011+03:00'
WHERE [Id] = 507;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269014+03:00'
WHERE [Id] = 508;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269016+03:00'
WHERE [Id] = 509;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269018+03:00'
WHERE [Id] = 510;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269020+03:00'
WHERE [Id] = 511;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269023+03:00'
WHERE [Id] = 512;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269025+03:00'
WHERE [Id] = 513;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269042+03:00'
WHERE [Id] = 514;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269044+03:00'
WHERE [Id] = 515;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269046+03:00'
WHERE [Id] = 516;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269049+03:00'
WHERE [Id] = 517;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269051+03:00'
WHERE [Id] = 518;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269054+03:00'
WHERE [Id] = 519;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269056+03:00'
WHERE [Id] = 520;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269058+03:00'
WHERE [Id] = 521;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269061+03:00'
WHERE [Id] = 522;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269063+03:00'
WHERE [Id] = 523;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269065+03:00'
WHERE [Id] = 524;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269067+03:00'
WHERE [Id] = 525;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269070+03:00'
WHERE [Id] = 526;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269072+03:00'
WHERE [Id] = 527;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269074+03:00'
WHERE [Id] = 528;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269076+03:00'
WHERE [Id] = 529;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269079+03:00'
WHERE [Id] = 530;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269081+03:00'
WHERE [Id] = 531;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269083+03:00'
WHERE [Id] = 532;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269086+03:00'
WHERE [Id] = 533;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269088+03:00'
WHERE [Id] = 534;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269096+03:00'
WHERE [Id] = 535;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269099+03:00'
WHERE [Id] = 536;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269101+03:00'
WHERE [Id] = 537;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269103+03:00'
WHERE [Id] = 538;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269106+03:00'
WHERE [Id] = 539;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269108+03:00'
WHERE [Id] = 540;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269110+03:00'
WHERE [Id] = 541;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269112+03:00'
WHERE [Id] = 542;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269115+03:00'
WHERE [Id] = 543;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269117+03:00'
WHERE [Id] = 544;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269119+03:00'
WHERE [Id] = 545;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269121+03:00'
WHERE [Id] = 546;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269124+03:00'
WHERE [Id] = 547;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269127+03:00'
WHERE [Id] = 548;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269129+03:00'
WHERE [Id] = 549;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269131+03:00'
WHERE [Id] = 550;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269133+03:00'
WHERE [Id] = 551;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269136+03:00'
WHERE [Id] = 552;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269138+03:00'
WHERE [Id] = 553;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269140+03:00'
WHERE [Id] = 554;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269142+03:00'
WHERE [Id] = 555;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269145+03:00'
WHERE [Id] = 556;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269147+03:00'
WHERE [Id] = 557;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269149+03:00'
WHERE [Id] = 558;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269151+03:00'
WHERE [Id] = 559;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269154+03:00'
WHERE [Id] = 560;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269156+03:00'
WHERE [Id] = 561;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269158+03:00'
WHERE [Id] = 562;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269161+03:00'
WHERE [Id] = 563;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269163+03:00'
WHERE [Id] = 564;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269166+03:00'
WHERE [Id] = 565;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269168+03:00'
WHERE [Id] = 566;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269170+03:00'
WHERE [Id] = 567;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269172+03:00'
WHERE [Id] = 568;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269175+03:00'
WHERE [Id] = 569;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269177+03:00'
WHERE [Id] = 570;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269179+03:00'
WHERE [Id] = 571;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269182+03:00'
WHERE [Id] = 572;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269184+03:00'
WHERE [Id] = 573;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269187+03:00'
WHERE [Id] = 574;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269189+03:00'
WHERE [Id] = 575;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269191+03:00'
WHERE [Id] = 576;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269200+03:00'
WHERE [Id] = 577;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269205+03:00'
WHERE [Id] = 578;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269208+03:00'
WHERE [Id] = 579;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269210+03:00'
WHERE [Id] = 580;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269212+03:00'
WHERE [Id] = 581;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269215+03:00'
WHERE [Id] = 582;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269217+03:00'
WHERE [Id] = 583;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269219+03:00'
WHERE [Id] = 584;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269221+03:00'
WHERE [Id] = 585;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269224+03:00'
WHERE [Id] = 586;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269226+03:00'
WHERE [Id] = 587;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269228+03:00'
WHERE [Id] = 588;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269231+03:00'
WHERE [Id] = 589;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269233+03:00'
WHERE [Id] = 590;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269235+03:00'
WHERE [Id] = 591;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269237+03:00'
WHERE [Id] = 592;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269240+03:00'
WHERE [Id] = 593;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269242+03:00'
WHERE [Id] = 594;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269244+03:00'
WHERE [Id] = 595;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269247+03:00'
WHERE [Id] = 596;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269249+03:00'
WHERE [Id] = 597;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269252+03:00'
WHERE [Id] = 598;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269254+03:00'
WHERE [Id] = 599;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269256+03:00'
WHERE [Id] = 600;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269258+03:00'
WHERE [Id] = 601;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269261+03:00'
WHERE [Id] = 602;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269263+03:00'
WHERE [Id] = 603;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269265+03:00'
WHERE [Id] = 604;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269267+03:00'
WHERE [Id] = 605;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269270+03:00'
WHERE [Id] = 606;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269272+03:00'
WHERE [Id] = 607;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269274+03:00'
WHERE [Id] = 608;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269276+03:00'
WHERE [Id] = 609;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269279+03:00'
WHERE [Id] = 610;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269281+03:00'
WHERE [Id] = 611;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269284+03:00'
WHERE [Id] = 612;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269286+03:00'
WHERE [Id] = 613;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269289+03:00'
WHERE [Id] = 614;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269291+03:00'
WHERE [Id] = 615;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269293+03:00'
WHERE [Id] = 616;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269295+03:00'
WHERE [Id] = 617;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269298+03:00'
WHERE [Id] = 618;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269300+03:00'
WHERE [Id] = 619;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269302+03:00'
WHERE [Id] = 620;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269304+03:00'
WHERE [Id] = 621;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269307+03:00'
WHERE [Id] = 622;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269309+03:00'
WHERE [Id] = 623;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269311+03:00'
WHERE [Id] = 624;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269313+03:00'
WHERE [Id] = 625;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269316+03:00'
WHERE [Id] = 626;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269319+03:00'
WHERE [Id] = 627;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269321+03:00'
WHERE [Id] = 628;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269323+03:00'
WHERE [Id] = 629;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269326+03:00'
WHERE [Id] = 630;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269328+03:00'
WHERE [Id] = 631;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269330+03:00'
WHERE [Id] = 632;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269332+03:00'
WHERE [Id] = 633;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269335+03:00'
WHERE [Id] = 634;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269337+03:00'
WHERE [Id] = 635;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269339+03:00'
WHERE [Id] = 636;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269341+03:00'
WHERE [Id] = 637;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269344+03:00'
WHERE [Id] = 638;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269346+03:00'
WHERE [Id] = 639;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269348+03:00'
WHERE [Id] = 640;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269350+03:00'
WHERE [Id] = 641;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269353+03:00'
WHERE [Id] = 642;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269356+03:00'
WHERE [Id] = 643;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269358+03:00'
WHERE [Id] = 644;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269360+03:00'
WHERE [Id] = 645;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269362+03:00'
WHERE [Id] = 646;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269373+03:00'
WHERE [Id] = 647;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269376+03:00'
WHERE [Id] = 648;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269378+03:00'
WHERE [Id] = 649;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269380+03:00'
WHERE [Id] = 650;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269383+03:00'
WHERE [Id] = 651;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269392+03:00'
WHERE [Id] = 652;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269397+03:00'
WHERE [Id] = 653;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269399+03:00'
WHERE [Id] = 654;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269401+03:00'
WHERE [Id] = 655;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269404+03:00'
WHERE [Id] = 656;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269407+03:00'
WHERE [Id] = 657;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269409+03:00'
WHERE [Id] = 658;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269411+03:00'
WHERE [Id] = 659;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269413+03:00'
WHERE [Id] = 660;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269416+03:00'
WHERE [Id] = 661;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269418+03:00'
WHERE [Id] = 662;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269420+03:00'
WHERE [Id] = 663;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269423+03:00'
WHERE [Id] = 664;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269425+03:00'
WHERE [Id] = 665;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269427+03:00'
WHERE [Id] = 666;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269429+03:00'
WHERE [Id] = 667;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269432+03:00'
WHERE [Id] = 668;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269434+03:00'
WHERE [Id] = 669;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269437+03:00'
WHERE [Id] = 670;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269439+03:00'
WHERE [Id] = 671;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269441+03:00'
WHERE [Id] = 672;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269443+03:00'
WHERE [Id] = 673;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269446+03:00'
WHERE [Id] = 674;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269448+03:00'
WHERE [Id] = 675;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269450+03:00'
WHERE [Id] = 676;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269452+03:00'
WHERE [Id] = 677;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269455+03:00'
WHERE [Id] = 678;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269457+03:00'
WHERE [Id] = 679;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269459+03:00'
WHERE [Id] = 680;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269461+03:00'
WHERE [Id] = 681;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269464+03:00'
WHERE [Id] = 682;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269466+03:00'
WHERE [Id] = 683;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269469+03:00'
WHERE [Id] = 684;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269471+03:00'
WHERE [Id] = 685;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269474+03:00'
WHERE [Id] = 686;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269476+03:00'
WHERE [Id] = 687;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269478+03:00'
WHERE [Id] = 688;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269480+03:00'
WHERE [Id] = 689;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269483+03:00'
WHERE [Id] = 690;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269485+03:00'
WHERE [Id] = 691;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269487+03:00'
WHERE [Id] = 692;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269489+03:00'
WHERE [Id] = 693;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269491+03:00'
WHERE [Id] = 694;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269494+03:00'
WHERE [Id] = 695;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269496+03:00'
WHERE [Id] = 696;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269498+03:00'
WHERE [Id] = 697;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269500+03:00'
WHERE [Id] = 698;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269504+03:00'
WHERE [Id] = 699;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269506+03:00'
WHERE [Id] = 700;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269508+03:00'
WHERE [Id] = 701;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269510+03:00'
WHERE [Id] = 702;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269513+03:00'
WHERE [Id] = 703;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269515+03:00'
WHERE [Id] = 704;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269517+03:00'
WHERE [Id] = 705;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269519+03:00'
WHERE [Id] = 706;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269522+03:00'
WHERE [Id] = 707;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269524+03:00'
WHERE [Id] = 708;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269526+03:00'
WHERE [Id] = 709;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269528+03:00'
WHERE [Id] = 710;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269531+03:00'
WHERE [Id] = 711;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269533+03:00'
WHERE [Id] = 712;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269535+03:00'
WHERE [Id] = 713;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269537+03:00'
WHERE [Id] = 714;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269540+03:00'
WHERE [Id] = 715;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269543+03:00'
WHERE [Id] = 716;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269545+03:00'
WHERE [Id] = 717;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269547+03:00'
WHERE [Id] = 718;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269549+03:00'
WHERE [Id] = 719;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269552+03:00'
WHERE [Id] = 720;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269554+03:00'
WHERE [Id] = 721;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269556+03:00'
WHERE [Id] = 722;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269558+03:00'
WHERE [Id] = 723;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269561+03:00'
WHERE [Id] = 724;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269563+03:00'
WHERE [Id] = 725;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269565+03:00'
WHERE [Id] = 726;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269567+03:00'
WHERE [Id] = 727;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269570+03:00'
WHERE [Id] = 728;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269572+03:00'
WHERE [Id] = 729;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269574+03:00'
WHERE [Id] = 730;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269583+03:00'
WHERE [Id] = 731;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269587+03:00'
WHERE [Id] = 732;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269589+03:00'
WHERE [Id] = 733;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269591+03:00'
WHERE [Id] = 734;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269593+03:00'
WHERE [Id] = 735;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269596+03:00'
WHERE [Id] = 736;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269598+03:00'
WHERE [Id] = 737;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269600+03:00'
WHERE [Id] = 738;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269602+03:00'
WHERE [Id] = 739;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269605+03:00'
WHERE [Id] = 740;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269607+03:00'
WHERE [Id] = 741;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269609+03:00'
WHERE [Id] = 742;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269611+03:00'
WHERE [Id] = 743;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269614+03:00'
WHERE [Id] = 744;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269616+03:00'
WHERE [Id] = 745;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269619+03:00'
WHERE [Id] = 746;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269621+03:00'
WHERE [Id] = 747;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269623+03:00'
WHERE [Id] = 748;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269626+03:00'
WHERE [Id] = 749;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269628+03:00'
WHERE [Id] = 750;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269630+03:00'
WHERE [Id] = 751;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269632+03:00'
WHERE [Id] = 752;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269635+03:00'
WHERE [Id] = 753;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269637+03:00'
WHERE [Id] = 754;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269639+03:00'
WHERE [Id] = 755;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269641+03:00'
WHERE [Id] = 756;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269644+03:00'
WHERE [Id] = 757;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269646+03:00'
WHERE [Id] = 758;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269648+03:00'
WHERE [Id] = 759;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269650+03:00'
WHERE [Id] = 760;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269654+03:00'
WHERE [Id] = 761;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269656+03:00'
WHERE [Id] = 762;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269658+03:00'
WHERE [Id] = 763;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269660+03:00'
WHERE [Id] = 764;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269663+03:00'
WHERE [Id] = 765;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269665+03:00'
WHERE [Id] = 766;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269667+03:00'
WHERE [Id] = 767;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269669+03:00'
WHERE [Id] = 768;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269672+03:00'
WHERE [Id] = 769;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269674+03:00'
WHERE [Id] = 770;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269676+03:00'
WHERE [Id] = 771;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269679+03:00'
WHERE [Id] = 772;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269681+03:00'
WHERE [Id] = 773;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269683+03:00'
WHERE [Id] = 774;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269686+03:00'
WHERE [Id] = 775;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269688+03:00'
WHERE [Id] = 776;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269690+03:00'
WHERE [Id] = 777;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269692+03:00'
WHERE [Id] = 778;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269695+03:00'
WHERE [Id] = 779;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269697+03:00'
WHERE [Id] = 780;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269699+03:00'
WHERE [Id] = 781;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269701+03:00'
WHERE [Id] = 782;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269704+03:00'
WHERE [Id] = 783;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269706+03:00'
WHERE [Id] = 784;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269708+03:00'
WHERE [Id] = 785;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269710+03:00'
WHERE [Id] = 786;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269713+03:00'
WHERE [Id] = 787;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269716+03:00'
WHERE [Id] = 788;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269718+03:00'
WHERE [Id] = 789;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269720+03:00'
WHERE [Id] = 790;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269722+03:00'
WHERE [Id] = 791;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269725+03:00'
WHERE [Id] = 792;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269727+03:00'
WHERE [Id] = 793;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269729+03:00'
WHERE [Id] = 794;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269731+03:00'
WHERE [Id] = 795;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269734+03:00'
WHERE [Id] = 796;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269736+03:00'
WHERE [Id] = 797;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269738+03:00'
WHERE [Id] = 798;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269740+03:00'
WHERE [Id] = 799;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269743+03:00'
WHERE [Id] = 800;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269745+03:00'
WHERE [Id] = 801;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269747+03:00'
WHERE [Id] = 802;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269750+03:00'
WHERE [Id] = 803;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269752+03:00'
WHERE [Id] = 804;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269755+03:00'
WHERE [Id] = 805;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269757+03:00'
WHERE [Id] = 806;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269759+03:00'
WHERE [Id] = 807;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269762+03:00'
WHERE [Id] = 808;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269764+03:00'
WHERE [Id] = 809;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269773+03:00'
WHERE [Id] = 810;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269776+03:00'
WHERE [Id] = 811;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269778+03:00'
WHERE [Id] = 812;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269780+03:00'
WHERE [Id] = 813;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269783+03:00'
WHERE [Id] = 814;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269785+03:00'
WHERE [Id] = 815;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269787+03:00'
WHERE [Id] = 816;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269789+03:00'
WHERE [Id] = 817;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269793+03:00'
WHERE [Id] = 818;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269795+03:00'
WHERE [Id] = 819;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269797+03:00'
WHERE [Id] = 820;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269799+03:00'
WHERE [Id] = 821;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269802+03:00'
WHERE [Id] = 822;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269804+03:00'
WHERE [Id] = 823;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269806+03:00'
WHERE [Id] = 824;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269808+03:00'
WHERE [Id] = 825;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269811+03:00'
WHERE [Id] = 826;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269821+03:00'
WHERE [Id] = 827;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269825+03:00'
WHERE [Id] = 828;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269827+03:00'
WHERE [Id] = 829;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269828+03:00'
WHERE [Id] = 830;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269830+03:00'
WHERE [Id] = 831;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269832+03:00'
WHERE [Id] = 832;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269833+03:00'
WHERE [Id] = 833;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269835+03:00'
WHERE [Id] = 834;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269837+03:00'
WHERE [Id] = 835;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269839+03:00'
WHERE [Id] = 836;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269840+03:00'
WHERE [Id] = 837;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269842+03:00'
WHERE [Id] = 838;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269844+03:00'
WHERE [Id] = 839;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269845+03:00'
WHERE [Id] = 840;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269847+03:00'
WHERE [Id] = 841;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269848+03:00'
WHERE [Id] = 842;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269850+03:00'
WHERE [Id] = 843;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269852+03:00'
WHERE [Id] = 844;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269858+03:00'
WHERE [Id] = 845;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269859+03:00'
WHERE [Id] = 846;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269861+03:00'
WHERE [Id] = 847;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269862+03:00'
WHERE [Id] = 848;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269865+03:00'
WHERE [Id] = 849;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269866+03:00'
WHERE [Id] = 850;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269868+03:00'
WHERE [Id] = 851;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269870+03:00'
WHERE [Id] = 852;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269871+03:00'
WHERE [Id] = 853;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269873+03:00'
WHERE [Id] = 854;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269874+03:00'
WHERE [Id] = 855;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269876+03:00'
WHERE [Id] = 856;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269878+03:00'
WHERE [Id] = 857;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269879+03:00'
WHERE [Id] = 858;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269881+03:00'
WHERE [Id] = 859;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269883+03:00'
WHERE [Id] = 860;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269884+03:00'
WHERE [Id] = 861;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269886+03:00'
WHERE [Id] = 862;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269887+03:00'
WHERE [Id] = 863;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269889+03:00'
WHERE [Id] = 864;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269891+03:00'
WHERE [Id] = 865;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269893+03:00'
WHERE [Id] = 866;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269895+03:00'
WHERE [Id] = 867;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269896+03:00'
WHERE [Id] = 868;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269898+03:00'
WHERE [Id] = 869;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269899+03:00'
WHERE [Id] = 870;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269901+03:00'
WHERE [Id] = 871;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269903+03:00'
WHERE [Id] = 872;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269904+03:00'
WHERE [Id] = 873;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269906+03:00'
WHERE [Id] = 874;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269908+03:00'
WHERE [Id] = 875;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269909+03:00'
WHERE [Id] = 876;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269911+03:00'
WHERE [Id] = 877;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269912+03:00'
WHERE [Id] = 878;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269914+03:00'
WHERE [Id] = 879;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269916+03:00'
WHERE [Id] = 880;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269918+03:00'
WHERE [Id] = 881;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269920+03:00'
WHERE [Id] = 882;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269921+03:00'
WHERE [Id] = 883;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269923+03:00'
WHERE [Id] = 884;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269924+03:00'
WHERE [Id] = 885;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269926+03:00'
WHERE [Id] = 886;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269933+03:00'
WHERE [Id] = 887;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269935+03:00'
WHERE [Id] = 888;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269937+03:00'
WHERE [Id] = 889;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269938+03:00'
WHERE [Id] = 890;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269940+03:00'
WHERE [Id] = 891;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269942+03:00'
WHERE [Id] = 892;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269943+03:00'
WHERE [Id] = 893;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269945+03:00'
WHERE [Id] = 894;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269946+03:00'
WHERE [Id] = 895;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269948+03:00'
WHERE [Id] = 896;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269950+03:00'
WHERE [Id] = 897;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269952+03:00'
WHERE [Id] = 898;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269954+03:00'
WHERE [Id] = 899;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269955+03:00'
WHERE [Id] = 900;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269957+03:00'
WHERE [Id] = 901;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269959+03:00'
WHERE [Id] = 902;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269960+03:00'
WHERE [Id] = 903;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269962+03:00'
WHERE [Id] = 904;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269963+03:00'
WHERE [Id] = 905;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269965+03:00'
WHERE [Id] = 906;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269967+03:00'
WHERE [Id] = 907;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269968+03:00'
WHERE [Id] = 908;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269970+03:00'
WHERE [Id] = 909;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269971+03:00'
WHERE [Id] = 910;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269973+03:00'
WHERE [Id] = 911;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269975+03:00'
WHERE [Id] = 912;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269977+03:00'
WHERE [Id] = 913;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269979+03:00'
WHERE [Id] = 914;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269980+03:00'
WHERE [Id] = 915;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269982+03:00'
WHERE [Id] = 916;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269983+03:00'
WHERE [Id] = 917;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269985+03:00'
WHERE [Id] = 918;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269987+03:00'
WHERE [Id] = 919;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269988+03:00'
WHERE [Id] = 920;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269990+03:00'
WHERE [Id] = 921;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269992+03:00'
WHERE [Id] = 922;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269994+03:00'
WHERE [Id] = 923;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269995+03:00'
WHERE [Id] = 924;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269997+03:00'
WHERE [Id] = 925;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6269999+03:00'
WHERE [Id] = 926;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270000+03:00'
WHERE [Id] = 927;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270002+03:00'
WHERE [Id] = 928;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270004+03:00'
WHERE [Id] = 929;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270005+03:00'
WHERE [Id] = 930;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270007+03:00'
WHERE [Id] = 931;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270008+03:00'
WHERE [Id] = 932;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270010+03:00'
WHERE [Id] = 933;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270012+03:00'
WHERE [Id] = 934;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270013+03:00'
WHERE [Id] = 935;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270015+03:00'
WHERE [Id] = 936;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270017+03:00'
WHERE [Id] = 937;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270019+03:00'
WHERE [Id] = 938;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270020+03:00'
WHERE [Id] = 939;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270022+03:00'
WHERE [Id] = 940;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270024+03:00'
WHERE [Id] = 941;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270025+03:00'
WHERE [Id] = 942;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270027+03:00'
WHERE [Id] = 943;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270029+03:00'
WHERE [Id] = 944;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270030+03:00'
WHERE [Id] = 945;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270032+03:00'
WHERE [Id] = 946;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270034+03:00'
WHERE [Id] = 947;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270035+03:00'
WHERE [Id] = 948;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270037+03:00'
WHERE [Id] = 949;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270039+03:00'
WHERE [Id] = 950;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270040+03:00'
WHERE [Id] = 951;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270042+03:00'
WHERE [Id] = 952;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270044+03:00'
WHERE [Id] = 953;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270045+03:00'
WHERE [Id] = 954;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270047+03:00'
WHERE [Id] = 955;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270048+03:00'
WHERE [Id] = 956;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270054+03:00'
WHERE [Id] = 957;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270055+03:00'
WHERE [Id] = 958;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270057+03:00'
WHERE [Id] = 959;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270059+03:00'
WHERE [Id] = 960;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270060+03:00'
WHERE [Id] = 961;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270063+03:00'
WHERE [Id] = 962;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270070+03:00'
WHERE [Id] = 963;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270072+03:00'
WHERE [Id] = 964;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270074+03:00'
WHERE [Id] = 965;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270076+03:00'
WHERE [Id] = 966;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270077+03:00'
WHERE [Id] = 967;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270079+03:00'
WHERE [Id] = 968;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270081+03:00'
WHERE [Id] = 969;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270082+03:00'
WHERE [Id] = 970;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270084+03:00'
WHERE [Id] = 971;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270085+03:00'
WHERE [Id] = 972;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270087+03:00'
WHERE [Id] = 973;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270089+03:00'
WHERE [Id] = 974;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270090+03:00'
WHERE [Id] = 975;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270092+03:00'
WHERE [Id] = 976;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270094+03:00'
WHERE [Id] = 977;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270096+03:00'
WHERE [Id] = 978;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270097+03:00'
WHERE [Id] = 979;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270099+03:00'
WHERE [Id] = 980;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270101+03:00'
WHERE [Id] = 981;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270102+03:00'
WHERE [Id] = 982;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270104+03:00'
WHERE [Id] = 983;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270106+03:00'
WHERE [Id] = 984;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270107+03:00'
WHERE [Id] = 985;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270109+03:00'
WHERE [Id] = 986;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270111+03:00'
WHERE [Id] = 987;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270112+03:00'
WHERE [Id] = 988;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270114+03:00'
WHERE [Id] = 989;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270115+03:00'
WHERE [Id] = 990;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270117+03:00'
WHERE [Id] = 991;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270119+03:00'
WHERE [Id] = 992;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270121+03:00'
WHERE [Id] = 993;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270123+03:00'
WHERE [Id] = 994;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270124+03:00'
WHERE [Id] = 995;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270126+03:00'
WHERE [Id] = 996;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270128+03:00'
WHERE [Id] = 997;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270129+03:00'
WHERE [Id] = 998;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270131+03:00'
WHERE [Id] = 999;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270133+03:00'
WHERE [Id] = 1000;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270134+03:00'
WHERE [Id] = 1001;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270136+03:00'
WHERE [Id] = 1002;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270138+03:00'
WHERE [Id] = 1003;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270139+03:00'
WHERE [Id] = 1004;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270141+03:00'
WHERE [Id] = 1005;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270142+03:00'
WHERE [Id] = 1006;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270144+03:00'
WHERE [Id] = 1007;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270146+03:00'
WHERE [Id] = 1008;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270148+03:00'
WHERE [Id] = 1009;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270150+03:00'
WHERE [Id] = 1010;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270151+03:00'
WHERE [Id] = 1011;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270153+03:00'
WHERE [Id] = 1012;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270155+03:00'
WHERE [Id] = 1013;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270156+03:00'
WHERE [Id] = 1014;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270158+03:00'
WHERE [Id] = 1015;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270159+03:00'
WHERE [Id] = 1016;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270161+03:00'
WHERE [Id] = 1017;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270163+03:00'
WHERE [Id] = 1018;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270164+03:00'
WHERE [Id] = 1019;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270166+03:00'
WHERE [Id] = 1020;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270168+03:00'
WHERE [Id] = 1021;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270169+03:00'
WHERE [Id] = 1022;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270171+03:00'
WHERE [Id] = 1023;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270173+03:00'
WHERE [Id] = 1024;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270175+03:00'
WHERE [Id] = 1025;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270197+03:00'
WHERE [Id] = 1026;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270199+03:00'
WHERE [Id] = 1027;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270203+03:00'
WHERE [Id] = 1028;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270205+03:00'
WHERE [Id] = 1029;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270207+03:00'
WHERE [Id] = 1030;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270208+03:00'
WHERE [Id] = 1031;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270210+03:00'
WHERE [Id] = 1032;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270211+03:00'
WHERE [Id] = 1033;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270213+03:00'
WHERE [Id] = 1034;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270215+03:00'
WHERE [Id] = 1035;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270216+03:00'
WHERE [Id] = 1036;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270218+03:00'
WHERE [Id] = 1037;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270220+03:00'
WHERE [Id] = 1038;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270221+03:00'
WHERE [Id] = 1039;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270223+03:00'
WHERE [Id] = 1040;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270224+03:00'
WHERE [Id] = 1041;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270230+03:00'
WHERE [Id] = 1042;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270235+03:00'
WHERE [Id] = 1043;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270237+03:00'
WHERE [Id] = 1044;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270239+03:00'
WHERE [Id] = 1045;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270241+03:00'
WHERE [Id] = 1046;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270242+03:00'
WHERE [Id] = 1047;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270244+03:00'
WHERE [Id] = 1048;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270246+03:00'
WHERE [Id] = 1049;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270247+03:00'
WHERE [Id] = 1050;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270249+03:00'
WHERE [Id] = 1051;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270251+03:00'
WHERE [Id] = 1052;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270252+03:00'
WHERE [Id] = 1053;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270254+03:00'
WHERE [Id] = 1054;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270255+03:00'
WHERE [Id] = 1055;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270257+03:00'
WHERE [Id] = 1056;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270259+03:00'
WHERE [Id] = 1057;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270260+03:00'
WHERE [Id] = 1058;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270262+03:00'
WHERE [Id] = 1059;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270264+03:00'
WHERE [Id] = 1060;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270266+03:00'
WHERE [Id] = 1061;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270267+03:00'
WHERE [Id] = 1062;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270269+03:00'
WHERE [Id] = 1063;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270271+03:00'
WHERE [Id] = 1064;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270272+03:00'
WHERE [Id] = 1065;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270274+03:00'
WHERE [Id] = 1066;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270276+03:00'
WHERE [Id] = 1067;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270277+03:00'
WHERE [Id] = 1068;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270283+03:00'
WHERE [Id] = 1069;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270285+03:00'
WHERE [Id] = 1070;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270286+03:00'
WHERE [Id] = 1071;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270288+03:00'
WHERE [Id] = 1072;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270290+03:00'
WHERE [Id] = 1073;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270291+03:00'
WHERE [Id] = 1074;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270293+03:00'
WHERE [Id] = 1075;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270295+03:00'
WHERE [Id] = 1076;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270297+03:00'
WHERE [Id] = 1077;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270298+03:00'
WHERE [Id] = 1078;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270300+03:00'
WHERE [Id] = 1079;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270302+03:00'
WHERE [Id] = 1080;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270303+03:00'
WHERE [Id] = 1081;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270305+03:00'
WHERE [Id] = 1082;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270306+03:00'
WHERE [Id] = 1083;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270308+03:00'
WHERE [Id] = 1084;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270310+03:00'
WHERE [Id] = 1085;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270311+03:00'
WHERE [Id] = 1086;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270313+03:00'
WHERE [Id] = 1087;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270315+03:00'
WHERE [Id] = 1088;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270316+03:00'
WHERE [Id] = 1089;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270318+03:00'
WHERE [Id] = 1090;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270319+03:00'
WHERE [Id] = 1091;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270322+03:00'
WHERE [Id] = 1092;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270323+03:00'
WHERE [Id] = 1093;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270325+03:00'
WHERE [Id] = 1094;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270327+03:00'
WHERE [Id] = 1095;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270328+03:00'
WHERE [Id] = 1096;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270330+03:00'
WHERE [Id] = 1097;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270331+03:00'
WHERE [Id] = 1098;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270532+03:00'
WHERE [Id] = 1099;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270546+03:00'
WHERE [Id] = 1100;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270549+03:00'
WHERE [Id] = 1101;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270551+03:00'
WHERE [Id] = 1102;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270553+03:00'
WHERE [Id] = 1103;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270554+03:00'
WHERE [Id] = 1104;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270556+03:00'
WHERE [Id] = 1105;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270558+03:00'
WHERE [Id] = 1106;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270559+03:00'
WHERE [Id] = 1107;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270561+03:00'
WHERE [Id] = 1108;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270562+03:00'
WHERE [Id] = 1109;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270564+03:00'
WHERE [Id] = 1110;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270566+03:00'
WHERE [Id] = 1111;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270567+03:00'
WHERE [Id] = 1112;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270569+03:00'
WHERE [Id] = 1113;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270571+03:00'
WHERE [Id] = 1114;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270573+03:00'
WHERE [Id] = 1115;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270575+03:00'
WHERE [Id] = 1116;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270576+03:00'
WHERE [Id] = 1117;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270578+03:00'
WHERE [Id] = 1118;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270593+03:00'
WHERE [Id] = 1119;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270596+03:00'
WHERE [Id] = 1120;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270597+03:00'
WHERE [Id] = 1121;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270599+03:00'
WHERE [Id] = 1122;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270601+03:00'
WHERE [Id] = 1123;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270602+03:00'
WHERE [Id] = 1124;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270604+03:00'
WHERE [Id] = 1125;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270606+03:00'
WHERE [Id] = 1126;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270607+03:00'
WHERE [Id] = 1127;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270609+03:00'
WHERE [Id] = 1128;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270611+03:00'
WHERE [Id] = 1129;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270613+03:00'
WHERE [Id] = 1130;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270615+03:00'
WHERE [Id] = 1131;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270616+03:00'
WHERE [Id] = 1132;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270618+03:00'
WHERE [Id] = 1133;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270620+03:00'
WHERE [Id] = 1134;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270621+03:00'
WHERE [Id] = 1135;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270623+03:00'
WHERE [Id] = 1136;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270624+03:00'
WHERE [Id] = 1137;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270626+03:00'
WHERE [Id] = 1138;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270628+03:00'
WHERE [Id] = 1139;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270629+03:00'
WHERE [Id] = 1140;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270631+03:00'
WHERE [Id] = 1141;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270633+03:00'
WHERE [Id] = 1142;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270635+03:00'
WHERE [Id] = 1143;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270637+03:00'
WHERE [Id] = 1144;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270638+03:00'
WHERE [Id] = 1145;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270640+03:00'
WHERE [Id] = 1146;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270641+03:00'
WHERE [Id] = 1147;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270643+03:00'
WHERE [Id] = 1148;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270645+03:00'
WHERE [Id] = 1149;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270646+03:00'
WHERE [Id] = 1150;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270648+03:00'
WHERE [Id] = 1151;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270650+03:00'
WHERE [Id] = 1152;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270651+03:00'
WHERE [Id] = 1153;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270653+03:00'
WHERE [Id] = 1154;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270655+03:00'
WHERE [Id] = 1155;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270656+03:00'
WHERE [Id] = 1156;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270659+03:00'
WHERE [Id] = 1157;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270660+03:00'
WHERE [Id] = 1158;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270662+03:00'
WHERE [Id] = 1159;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270663+03:00'
WHERE [Id] = 1160;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270665+03:00'
WHERE [Id] = 1161;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270667+03:00'
WHERE [Id] = 1162;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270668+03:00'
WHERE [Id] = 1163;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270670+03:00'
WHERE [Id] = 1164;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270672+03:00'
WHERE [Id] = 1165;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270673+03:00'
WHERE [Id] = 1166;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270675+03:00'
WHERE [Id] = 1167;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270677+03:00'
WHERE [Id] = 1168;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270678+03:00'
WHERE [Id] = 1169;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270680+03:00'
WHERE [Id] = 1170;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270682+03:00'
WHERE [Id] = 1171;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270684+03:00'
WHERE [Id] = 1172;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270685+03:00'
WHERE [Id] = 1173;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270687+03:00'
WHERE [Id] = 1174;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270689+03:00'
WHERE [Id] = 1175;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270690+03:00'
WHERE [Id] = 1176;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270692+03:00'
WHERE [Id] = 1177;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270694+03:00'
WHERE [Id] = 1178;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270695+03:00'
WHERE [Id] = 1179;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270697+03:00'
WHERE [Id] = 1180;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270699+03:00'
WHERE [Id] = 1181;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270700+03:00'
WHERE [Id] = 1182;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270702+03:00'
WHERE [Id] = 1183;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270704+03:00'
WHERE [Id] = 1184;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270706+03:00'
WHERE [Id] = 1185;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270707+03:00'
WHERE [Id] = 1186;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270709+03:00'
WHERE [Id] = 1187;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270711+03:00'
WHERE [Id] = 1188;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270712+03:00'
WHERE [Id] = 1189;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270714+03:00'
WHERE [Id] = 1190;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270716+03:00'
WHERE [Id] = 1191;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270717+03:00'
WHERE [Id] = 1192;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270719+03:00'
WHERE [Id] = 1193;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270721+03:00'
WHERE [Id] = 1194;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270723+03:00'
WHERE [Id] = 1195;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270724+03:00'
WHERE [Id] = 1196;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270726+03:00'
WHERE [Id] = 1197;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270733+03:00'
WHERE [Id] = 1198;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270735+03:00'
WHERE [Id] = 1199;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270737+03:00'
WHERE [Id] = 1200;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270738+03:00'
WHERE [Id] = 1201;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270740+03:00'
WHERE [Id] = 1202;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270741+03:00'
WHERE [Id] = 1203;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270743+03:00'
WHERE [Id] = 1204;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270745+03:00'
WHERE [Id] = 1205;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270746+03:00'
WHERE [Id] = 1206;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270748+03:00'
WHERE [Id] = 1207;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270750+03:00'
WHERE [Id] = 1208;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270752+03:00'
WHERE [Id] = 1209;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270753+03:00'
WHERE [Id] = 1210;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270755+03:00'
WHERE [Id] = 1211;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270757+03:00'
WHERE [Id] = 1212;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270758+03:00'
WHERE [Id] = 1213;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270760+03:00'
WHERE [Id] = 1214;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270762+03:00'
WHERE [Id] = 1215;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270763+03:00'
WHERE [Id] = 1216;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270765+03:00'
WHERE [Id] = 1217;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270767+03:00'
WHERE [Id] = 1218;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270769+03:00'
WHERE [Id] = 1219;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270770+03:00'
WHERE [Id] = 1220;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270772+03:00'
WHERE [Id] = 1221;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270773+03:00'
WHERE [Id] = 1222;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270775+03:00'
WHERE [Id] = 1223;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270777+03:00'
WHERE [Id] = 1224;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270778+03:00'
WHERE [Id] = 1225;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270780+03:00'
WHERE [Id] = 1226;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270782+03:00'
WHERE [Id] = 1227;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270783+03:00'
WHERE [Id] = 1228;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270785+03:00'
WHERE [Id] = 1229;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270787+03:00'
WHERE [Id] = 1230;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270788+03:00'
WHERE [Id] = 1231;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270790+03:00'
WHERE [Id] = 1232;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270792+03:00'
WHERE [Id] = 1233;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270794+03:00'
WHERE [Id] = 1234;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270796+03:00'
WHERE [Id] = 1235;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270798+03:00'
WHERE [Id] = 1236;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270799+03:00'
WHERE [Id] = 1237;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270801+03:00'
WHERE [Id] = 1238;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270802+03:00'
WHERE [Id] = 1239;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270804+03:00'
WHERE [Id] = 1240;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270806+03:00'
WHERE [Id] = 1241;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270807+03:00'
WHERE [Id] = 1242;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270809+03:00'
WHERE [Id] = 1243;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270811+03:00'
WHERE [Id] = 1244;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270812+03:00'
WHERE [Id] = 1245;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270814+03:00'
WHERE [Id] = 1246;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270816+03:00'
WHERE [Id] = 1247;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270817+03:00'
WHERE [Id] = 1248;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270819+03:00'
WHERE [Id] = 1249;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270821+03:00'
WHERE [Id] = 1250;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270823+03:00'
WHERE [Id] = 1251;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270824+03:00'
WHERE [Id] = 1252;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270826+03:00'
WHERE [Id] = 1253;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270828+03:00'
WHERE [Id] = 1254;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270829+03:00'
WHERE [Id] = 1255;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270831+03:00'
WHERE [Id] = 1256;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270832+03:00'
WHERE [Id] = 1257;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270834+03:00'
WHERE [Id] = 1258;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270836+03:00'
WHERE [Id] = 1259;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270837+03:00'
WHERE [Id] = 1260;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270839+03:00'
WHERE [Id] = 1261;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270841+03:00'
WHERE [Id] = 1262;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270843+03:00'
WHERE [Id] = 1263;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270844+03:00'
WHERE [Id] = 1264;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270846+03:00'
WHERE [Id] = 1265;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270848+03:00'
WHERE [Id] = 1266;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270864+03:00'
WHERE [Id] = 1267;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270866+03:00'
WHERE [Id] = 1268;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270868+03:00'
WHERE [Id] = 1269;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270869+03:00'
WHERE [Id] = 1270;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270871+03:00'
WHERE [Id] = 1271;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270880+03:00'
WHERE [Id] = 1272;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270882+03:00'
WHERE [Id] = 1273;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270883+03:00'
WHERE [Id] = 1274;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270885+03:00'
WHERE [Id] = 1275;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270887+03:00'
WHERE [Id] = 1276;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270888+03:00'
WHERE [Id] = 1277;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270890+03:00'
WHERE [Id] = 1278;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270891+03:00'
WHERE [Id] = 1279;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270893+03:00'
WHERE [Id] = 1280;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270895+03:00'
WHERE [Id] = 1281;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270896+03:00'
WHERE [Id] = 1282;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270898+03:00'
WHERE [Id] = 1283;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270900+03:00'
WHERE [Id] = 1284;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270901+03:00'
WHERE [Id] = 1285;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270903+03:00'
WHERE [Id] = 1286;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270905+03:00'
WHERE [Id] = 1287;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270907+03:00'
WHERE [Id] = 1288;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270908+03:00'
WHERE [Id] = 1289;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270910+03:00'
WHERE [Id] = 1290;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270912+03:00'
WHERE [Id] = 1291;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270913+03:00'
WHERE [Id] = 1292;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270915+03:00'
WHERE [Id] = 1293;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270917+03:00'
WHERE [Id] = 1294;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270918+03:00'
WHERE [Id] = 1295;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270920+03:00'
WHERE [Id] = 1296;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270921+03:00'
WHERE [Id] = 1297;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270923+03:00'
WHERE [Id] = 1298;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270925+03:00'
WHERE [Id] = 1299;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270926+03:00'
WHERE [Id] = 1300;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270928+03:00'
WHERE [Id] = 1301;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270930+03:00'
WHERE [Id] = 1302;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270932+03:00'
WHERE [Id] = 1303;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270933+03:00'
WHERE [Id] = 1304;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270935+03:00'
WHERE [Id] = 1305;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270937+03:00'
WHERE [Id] = 1306;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270938+03:00'
WHERE [Id] = 1307;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270940+03:00'
WHERE [Id] = 1308;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270942+03:00'
WHERE [Id] = 1309;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270944+03:00'
WHERE [Id] = 1310;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270945+03:00'
WHERE [Id] = 1311;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270947+03:00'
WHERE [Id] = 1312;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270949+03:00'
WHERE [Id] = 1313;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270950+03:00'
WHERE [Id] = 1314;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270952+03:00'
WHERE [Id] = 1315;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270954+03:00'
WHERE [Id] = 1316;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270955+03:00'
WHERE [Id] = 1317;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270957+03:00'
WHERE [Id] = 1318;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270959+03:00'
WHERE [Id] = 1319;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270960+03:00'
WHERE [Id] = 1320;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270962+03:00'
WHERE [Id] = 1321;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270963+03:00'
WHERE [Id] = 1322;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270966+03:00'
WHERE [Id] = 1323;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270967+03:00'
WHERE [Id] = 1324;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270969+03:00'
WHERE [Id] = 1325;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270971+03:00'
WHERE [Id] = 1326;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270972+03:00'
WHERE [Id] = 1327;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270974+03:00'
WHERE [Id] = 1328;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270975+03:00'
WHERE [Id] = 1329;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270977+03:00'
WHERE [Id] = 1330;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270979+03:00'
WHERE [Id] = 1331;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270980+03:00'
WHERE [Id] = 1332;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270982+03:00'
WHERE [Id] = 1333;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270983+03:00'
WHERE [Id] = 1334;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270985+03:00'
WHERE [Id] = 1335;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270987+03:00'
WHERE [Id] = 1336;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270989+03:00'
WHERE [Id] = 1337;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270991+03:00'
WHERE [Id] = 1338;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270992+03:00'
WHERE [Id] = 1339;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270994+03:00'
WHERE [Id] = 1340;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270995+03:00'
WHERE [Id] = 1341;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270997+03:00'
WHERE [Id] = 1342;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6270999+03:00'
WHERE [Id] = 1343;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271000+03:00'
WHERE [Id] = 1344;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271002+03:00'
WHERE [Id] = 1345;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271004+03:00'
WHERE [Id] = 1346;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271005+03:00'
WHERE [Id] = 1347;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271007+03:00'
WHERE [Id] = 1348;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271008+03:00'
WHERE [Id] = 1349;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271010+03:00'
WHERE [Id] = 1350;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271019+03:00'
WHERE [Id] = 1351;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271020+03:00'
WHERE [Id] = 1352;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271022+03:00'
WHERE [Id] = 1353;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271024+03:00'
WHERE [Id] = 1354;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271025+03:00'
WHERE [Id] = 1355;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271027+03:00'
WHERE [Id] = 1356;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271028+03:00'
WHERE [Id] = 1357;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271030+03:00'
WHERE [Id] = 1358;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271032+03:00'
WHERE [Id] = 1359;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271033+03:00'
WHERE [Id] = 1360;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271035+03:00'
WHERE [Id] = 1361;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271037+03:00'
WHERE [Id] = 1362;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271038+03:00'
WHERE [Id] = 1363;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271040+03:00'
WHERE [Id] = 1364;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271042+03:00'
WHERE [Id] = 1365;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271044+03:00'
WHERE [Id] = 1366;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271045+03:00'
WHERE [Id] = 1367;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271047+03:00'
WHERE [Id] = 1368;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271049+03:00'
WHERE [Id] = 1369;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271050+03:00'
WHERE [Id] = 1370;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271052+03:00'
WHERE [Id] = 1371;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271053+03:00'
WHERE [Id] = 1372;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271055+03:00'
WHERE [Id] = 1373;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271057+03:00'
WHERE [Id] = 1374;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271058+03:00'
WHERE [Id] = 1375;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271060+03:00'
WHERE [Id] = 1376;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271062+03:00'
WHERE [Id] = 1377;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271063+03:00'
WHERE [Id] = 1378;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271070+03:00'
WHERE [Id] = 1379;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271071+03:00'
WHERE [Id] = 1380;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271073+03:00'
WHERE [Id] = 1381;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271075+03:00'
WHERE [Id] = 1382;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271076+03:00'
WHERE [Id] = 1383;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271078+03:00'
WHERE [Id] = 1384;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271079+03:00'
WHERE [Id] = 1385;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271081+03:00'
WHERE [Id] = 1386;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271083+03:00'
WHERE [Id] = 1387;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271084+03:00'
WHERE [Id] = 1388;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271086+03:00'
WHERE [Id] = 1389;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271088+03:00'
WHERE [Id] = 1390;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271089+03:00'
WHERE [Id] = 1391;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271092+03:00'
WHERE [Id] = 1392;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271093+03:00'
WHERE [Id] = 1393;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271095+03:00'
WHERE [Id] = 1394;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271096+03:00'
WHERE [Id] = 1395;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271098+03:00'
WHERE [Id] = 1396;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271100+03:00'
WHERE [Id] = 1397;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271101+03:00'
WHERE [Id] = 1398;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271103+03:00'
WHERE [Id] = 1399;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271105+03:00'
WHERE [Id] = 1400;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271106+03:00'
WHERE [Id] = 1401;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271108+03:00'
WHERE [Id] = 1402;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271110+03:00'
WHERE [Id] = 1403;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271111+03:00'
WHERE [Id] = 1404;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271113+03:00'
WHERE [Id] = 1405;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271114+03:00'
WHERE [Id] = 1406;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271117+03:00'
WHERE [Id] = 1407;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271118+03:00'
WHERE [Id] = 1408;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271120+03:00'
WHERE [Id] = 1409;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271122+03:00'
WHERE [Id] = 1410;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271123+03:00'
WHERE [Id] = 1411;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271125+03:00'
WHERE [Id] = 1412;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271126+03:00'
WHERE [Id] = 1413;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271128+03:00'
WHERE [Id] = 1414;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271130+03:00'
WHERE [Id] = 1415;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271131+03:00'
WHERE [Id] = 1416;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271133+03:00'
WHERE [Id] = 1417;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271135+03:00'
WHERE [Id] = 1418;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271136+03:00'
WHERE [Id] = 1419;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271138+03:00'
WHERE [Id] = 1420;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271140+03:00'
WHERE [Id] = 1421;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271142+03:00'
WHERE [Id] = 1422;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271143+03:00'
WHERE [Id] = 1423;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271145+03:00'
WHERE [Id] = 1424;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271147+03:00'
WHERE [Id] = 1425;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271148+03:00'
WHERE [Id] = 1426;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271156+03:00'
WHERE [Id] = 1427;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271159+03:00'
WHERE [Id] = 1428;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271161+03:00'
WHERE [Id] = 1429;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271162+03:00'
WHERE [Id] = 1430;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271164+03:00'
WHERE [Id] = 1431;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271166+03:00'
WHERE [Id] = 1432;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271167+03:00'
WHERE [Id] = 1433;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271169+03:00'
WHERE [Id] = 1434;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271171+03:00'
WHERE [Id] = 1435;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271173+03:00'
WHERE [Id] = 1436;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271174+03:00'
WHERE [Id] = 1437;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271176+03:00'
WHERE [Id] = 1438;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271178+03:00'
WHERE [Id] = 1439;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271179+03:00'
WHERE [Id] = 1440;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271181+03:00'
WHERE [Id] = 1441;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271183+03:00'
WHERE [Id] = 1442;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271184+03:00'
WHERE [Id] = 1443;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271186+03:00'
WHERE [Id] = 1444;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271187+03:00'
WHERE [Id] = 1445;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271189+03:00'
WHERE [Id] = 1446;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271191+03:00'
WHERE [Id] = 1447;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271192+03:00'
WHERE [Id] = 1448;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271194+03:00'
WHERE [Id] = 1449;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271196+03:00'
WHERE [Id] = 1450;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271198+03:00'
WHERE [Id] = 1451;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271199+03:00'
WHERE [Id] = 1452;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271201+03:00'
WHERE [Id] = 1453;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271202+03:00'
WHERE [Id] = 1454;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271204+03:00'
WHERE [Id] = 1455;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271206+03:00'
WHERE [Id] = 1456;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271207+03:00'
WHERE [Id] = 1457;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271209+03:00'
WHERE [Id] = 1458;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271211+03:00'
WHERE [Id] = 1459;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271212+03:00'
WHERE [Id] = 1460;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271214+03:00'
WHERE [Id] = 1461;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271215+03:00'
WHERE [Id] = 1462;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271217+03:00'
WHERE [Id] = 1463;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271219+03:00'
WHERE [Id] = 1464;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271221+03:00'
WHERE [Id] = 1465;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271223+03:00'
WHERE [Id] = 1466;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271224+03:00'
WHERE [Id] = 1467;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271226+03:00'
WHERE [Id] = 1468;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271227+03:00'
WHERE [Id] = 1469;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271229+03:00'
WHERE [Id] = 1470;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271231+03:00'
WHERE [Id] = 1471;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271232+03:00'
WHERE [Id] = 1472;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271234+03:00'
WHERE [Id] = 1473;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271236+03:00'
WHERE [Id] = 1474;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271237+03:00'
WHERE [Id] = 1475;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271239+03:00'
WHERE [Id] = 1476;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271240+03:00'
WHERE [Id] = 1477;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271243+03:00'
WHERE [Id] = 1478;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271244+03:00'
WHERE [Id] = 1479;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271246+03:00'
WHERE [Id] = 1480;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271248+03:00'
WHERE [Id] = 1481;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271249+03:00'
WHERE [Id] = 1482;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271251+03:00'
WHERE [Id] = 1483;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271252+03:00'
WHERE [Id] = 1484;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271254+03:00'
WHERE [Id] = 1485;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271256+03:00'
WHERE [Id] = 1486;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271258+03:00'
WHERE [Id] = 1487;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271259+03:00'
WHERE [Id] = 1488;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271261+03:00'
WHERE [Id] = 1489;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271263+03:00'
WHERE [Id] = 1490;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271268+03:00'
WHERE [Id] = 1491;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271270+03:00'
WHERE [Id] = 1492;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271272+03:00'
WHERE [Id] = 1493;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271273+03:00'
WHERE [Id] = 1494;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271275+03:00'
WHERE [Id] = 1495;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271276+03:00'
WHERE [Id] = 1496;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271278+03:00'
WHERE [Id] = 1497;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271280+03:00'
WHERE [Id] = 1498;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271282+03:00'
WHERE [Id] = 1499;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271284+03:00'
WHERE [Id] = 1500;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271285+03:00'
WHERE [Id] = 1501;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271287+03:00'
WHERE [Id] = 1502;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271288+03:00'
WHERE [Id] = 1503;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271296+03:00'
WHERE [Id] = 1504;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271298+03:00'
WHERE [Id] = 1505;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271300+03:00'
WHERE [Id] = 1506;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271301+03:00'
WHERE [Id] = 1507;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271303+03:00'
WHERE [Id] = 1508;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271304+03:00'
WHERE [Id] = 1509;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271306+03:00'
WHERE [Id] = 1510;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271308+03:00'
WHERE [Id] = 1511;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271309+03:00'
WHERE [Id] = 1512;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271312+03:00'
WHERE [Id] = 1513;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271313+03:00'
WHERE [Id] = 1514;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271315+03:00'
WHERE [Id] = 1515;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271316+03:00'
WHERE [Id] = 1516;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271318+03:00'
WHERE [Id] = 1517;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271320+03:00'
WHERE [Id] = 1518;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271321+03:00'
WHERE [Id] = 1519;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271323+03:00'
WHERE [Id] = 1520;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271325+03:00'
WHERE [Id] = 1521;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271326+03:00'
WHERE [Id] = 1522;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271328+03:00'
WHERE [Id] = 1523;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271329+03:00'
WHERE [Id] = 1524;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271331+03:00'
WHERE [Id] = 1525;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271333+03:00'
WHERE [Id] = 1526;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271335+03:00'
WHERE [Id] = 1527;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271337+03:00'
WHERE [Id] = 1528;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271338+03:00'
WHERE [Id] = 1529;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271340+03:00'
WHERE [Id] = 1530;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271341+03:00'
WHERE [Id] = 1531;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271343+03:00'
WHERE [Id] = 1532;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271345+03:00'
WHERE [Id] = 1533;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271346+03:00'
WHERE [Id] = 1534;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271348+03:00'
WHERE [Id] = 1535;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271350+03:00'
WHERE [Id] = 1536;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271351+03:00'
WHERE [Id] = 1537;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271353+03:00'
WHERE [Id] = 1538;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271355+03:00'
WHERE [Id] = 1539;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271356+03:00'
WHERE [Id] = 1540;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271358+03:00'
WHERE [Id] = 1541;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271360+03:00'
WHERE [Id] = 1542;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271362+03:00'
WHERE [Id] = 1543;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271363+03:00'
WHERE [Id] = 1544;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271365+03:00'
WHERE [Id] = 1545;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271367+03:00'
WHERE [Id] = 1546;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271368+03:00'
WHERE [Id] = 1547;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271370+03:00'
WHERE [Id] = 1548;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271372+03:00'
WHERE [Id] = 1549;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271373+03:00'
WHERE [Id] = 1550;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271375+03:00'
WHERE [Id] = 1551;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271376+03:00'
WHERE [Id] = 1552;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271378+03:00'
WHERE [Id] = 1553;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271380+03:00'
WHERE [Id] = 1554;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271382+03:00'
WHERE [Id] = 1555;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271384+03:00'
WHERE [Id] = 1556;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271385+03:00'
WHERE [Id] = 1557;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271387+03:00'
WHERE [Id] = 1558;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271388+03:00'
WHERE [Id] = 1559;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271390+03:00'
WHERE [Id] = 1560;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271392+03:00'
WHERE [Id] = 1561;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271393+03:00'
WHERE [Id] = 1562;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271395+03:00'
WHERE [Id] = 1563;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271397+03:00'
WHERE [Id] = 1564;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271398+03:00'
WHERE [Id] = 1565;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271400+03:00'
WHERE [Id] = 1566;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271402+03:00'
WHERE [Id] = 1567;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271403+03:00'
WHERE [Id] = 1568;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271405+03:00'
WHERE [Id] = 1569;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271407+03:00'
WHERE [Id] = 1570;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271409+03:00'
WHERE [Id] = 1571;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271410+03:00'
WHERE [Id] = 1572;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271412+03:00'
WHERE [Id] = 1573;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271414+03:00'
WHERE [Id] = 1574;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271415+03:00'
WHERE [Id] = 1575;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271417+03:00'
WHERE [Id] = 1576;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271419+03:00'
WHERE [Id] = 1577;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271420+03:00'
WHERE [Id] = 1578;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271422+03:00'
WHERE [Id] = 1579;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271423+03:00'
WHERE [Id] = 1580;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271425+03:00'
WHERE [Id] = 1581;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271427+03:00'
WHERE [Id] = 1582;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271436+03:00'
WHERE [Id] = 1583;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271438+03:00'
WHERE [Id] = 1584;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271440+03:00'
WHERE [Id] = 1585;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271441+03:00'
WHERE [Id] = 1586;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271443+03:00'
WHERE [Id] = 1587;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271445+03:00'
WHERE [Id] = 1588;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271446+03:00'
WHERE [Id] = 1589;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271448+03:00'
WHERE [Id] = 1590;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271450+03:00'
WHERE [Id] = 1591;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271451+03:00'
WHERE [Id] = 1592;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271453+03:00'
WHERE [Id] = 1593;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271454+03:00'
WHERE [Id] = 1594;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271456+03:00'
WHERE [Id] = 1595;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271458+03:00'
WHERE [Id] = 1596;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271460+03:00'
WHERE [Id] = 1597;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271462+03:00'
WHERE [Id] = 1598;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271463+03:00'
WHERE [Id] = 1599;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271465+03:00'
WHERE [Id] = 1600;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271466+03:00'
WHERE [Id] = 1601;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271468+03:00'
WHERE [Id] = 1602;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271470+03:00'
WHERE [Id] = 1603;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271471+03:00'
WHERE [Id] = 1604;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271473+03:00'
WHERE [Id] = 1605;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271475+03:00'
WHERE [Id] = 1606;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271476+03:00'
WHERE [Id] = 1607;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271478+03:00'
WHERE [Id] = 1608;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271479+03:00'
WHERE [Id] = 1609;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271481+03:00'
WHERE [Id] = 1610;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271483+03:00'
WHERE [Id] = 1611;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271485+03:00'
WHERE [Id] = 1612;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271487+03:00'
WHERE [Id] = 1613;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271488+03:00'
WHERE [Id] = 1614;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271490+03:00'
WHERE [Id] = 1615;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271491+03:00'
WHERE [Id] = 1616;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271493+03:00'
WHERE [Id] = 1617;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271495+03:00'
WHERE [Id] = 1618;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271496+03:00'
WHERE [Id] = 1619;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271498+03:00'
WHERE [Id] = 1620;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271500+03:00'
WHERE [Id] = 1621;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271501+03:00'
WHERE [Id] = 1622;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271503+03:00'
WHERE [Id] = 1623;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271504+03:00'
WHERE [Id] = 1624;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271507+03:00'
WHERE [Id] = 1625;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271508+03:00'
WHERE [Id] = 1626;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271510+03:00'
WHERE [Id] = 1627;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271512+03:00'
WHERE [Id] = 1628;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271513+03:00'
WHERE [Id] = 1629;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271515+03:00'
WHERE [Id] = 1630;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271516+03:00'
WHERE [Id] = 1631;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271518+03:00'
WHERE [Id] = 1632;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271520+03:00'
WHERE [Id] = 1633;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271521+03:00'
WHERE [Id] = 1634;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271523+03:00'
WHERE [Id] = 1635;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271525+03:00'
WHERE [Id] = 1636;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271526+03:00'
WHERE [Id] = 1637;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271528+03:00'
WHERE [Id] = 1638;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271530+03:00'
WHERE [Id] = 1639;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271532+03:00'
WHERE [Id] = 1640;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271533+03:00'
WHERE [Id] = 1641;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271535+03:00'
WHERE [Id] = 1642;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271537+03:00'
WHERE [Id] = 1643;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271538+03:00'
WHERE [Id] = 1644;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271540+03:00'
WHERE [Id] = 1645;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271541+03:00'
WHERE [Id] = 1646;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271543+03:00'
WHERE [Id] = 1647;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271545+03:00'
WHERE [Id] = 1648;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271546+03:00'
WHERE [Id] = 1649;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271548+03:00'
WHERE [Id] = 1650;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271550+03:00'
WHERE [Id] = 1651;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271551+03:00'
WHERE [Id] = 1652;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271553+03:00'
WHERE [Id] = 1653;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271555+03:00'
WHERE [Id] = 1654;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271557+03:00'
WHERE [Id] = 1655;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271558+03:00'
WHERE [Id] = 1656;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271560+03:00'
WHERE [Id] = 1657;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271562+03:00'
WHERE [Id] = 1658;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271563+03:00'
WHERE [Id] = 1659;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271565+03:00'
WHERE [Id] = 1660;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271566+03:00'
WHERE [Id] = 1661;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271574+03:00'
WHERE [Id] = 1662;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271575+03:00'
WHERE [Id] = 1663;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271577+03:00'
WHERE [Id] = 1664;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271578+03:00'
WHERE [Id] = 1665;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271580+03:00'
WHERE [Id] = 1666;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271582+03:00'
WHERE [Id] = 1667;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271584+03:00'
WHERE [Id] = 1668;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271586+03:00'
WHERE [Id] = 1669;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271587+03:00'
WHERE [Id] = 1670;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271589+03:00'
WHERE [Id] = 1671;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271590+03:00'
WHERE [Id] = 1672;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271592+03:00'
WHERE [Id] = 1673;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271594+03:00'
WHERE [Id] = 1674;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271595+03:00'
WHERE [Id] = 1675;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271597+03:00'
WHERE [Id] = 1676;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271599+03:00'
WHERE [Id] = 1677;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271600+03:00'
WHERE [Id] = 1678;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271602+03:00'
WHERE [Id] = 1679;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271603+03:00'
WHERE [Id] = 1680;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271606+03:00'
WHERE [Id] = 1681;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271607+03:00'
WHERE [Id] = 1682;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271609+03:00'
WHERE [Id] = 1683;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271611+03:00'
WHERE [Id] = 1684;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271612+03:00'
WHERE [Id] = 1685;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271614+03:00'
WHERE [Id] = 1686;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271616+03:00'
WHERE [Id] = 1687;
SELECT @@ROWCOUNT;


UPDATE [GalleryLikes] SET [CreatedAt] = '2026-05-07T12:42:16.6271617+03:00'
WHERE [Id] = 1688;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Author', N'Category', N'CoverImageUrl', N'Description', N'PdfUrl', N'PositionX', N'PositionY', N'PositionZ', N'RotationY', N'Title') AND [object_id] = OBJECT_ID(N'[LibraryBooks]'))
    SET IDENTITY_INSERT [LibraryBooks] ON;
INSERT INTO [LibraryBooks] ([Id], [Author], [Category], [CoverImageUrl], [Description], [PdfUrl], [PositionX], [PositionY], [PositionZ], [RotationY], [Title])
VALUES (1, N'Dr. Ahmet Yılmaz', N'', N'https://images.unsplash.com/photo-1544947950-fa07a98d237f?w=600', N'Ağ sistemlerinin derinliklerine inen kapsamlı bir rehber.', N'', CAST(-2 AS real), CAST(1.5 AS real), CAST(-4 AS real), CAST(45 AS real), N'Ağ Teknolojileri Temelleri'),
(2, N'Prof. Dr. İber Ortaylı', N'', N'https://images.unsplash.com/photo-1589998059171-989d887df446?w=600', N'Geçmişten günümüze sanat yolculuğu.', N'', CAST(2 AS real), CAST(1.5 AS real), CAST(-4 AS real), CAST(-45 AS real), N'Osmanlı Sanat Tarihi');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Author', N'Category', N'CoverImageUrl', N'Description', N'PdfUrl', N'PositionX', N'PositionY', N'PositionZ', N'RotationY', N'Title') AND [object_id] = OBJECT_ID(N'[LibraryBooks]'))
    SET IDENTITY_INSERT [LibraryBooks] OFF;

UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T12:42:16.6250749+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T12:42:16.6251676+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T12:42:16.6251696+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T12:42:16.6252341+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T12:42:16.6252347+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T12:42:16.6252357+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T12:42:16.6252666+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T12:42:16.6252669+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T12:42:16.6252672+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T12:42:16.6253110+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T12:42:16.6253112+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T12:42:16.6253114+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T12:42:16.6253382+03:00'
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T12:42:16.6253384+03:00'
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T12:42:16.6253387+03:00'
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T12:42:16.6253842+03:00'
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T12:42:16.6253845+03:00'
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T12:42:16.6253850+03:00'
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T12:42:16.6254136+03:00'
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T12:42:16.6254138+03:00'
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T12:42:16.6254140+03:00'
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T12:42:16.6254509+03:00'
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T12:42:16.6254511+03:00'
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T12:42:16.6254513+03:00'
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ImageUrl', N'LibraryBookId', N'PageNumber', N'TextContent') AND [object_id] = OBJECT_ID(N'[LibraryBookPages]'))
    SET IDENTITY_INSERT [LibraryBookPages] ON;
INSERT INTO [LibraryBookPages] ([Id], [ImageUrl], [LibraryBookId], [PageNumber], [TextContent])
VALUES (1, N'https://images.unsplash.com/photo-1522030299830-16b8d3d049fe?w=600', 1, 1, N'Ağ teknolojileri, modern bilgisayar iletişiminin temel taşıdır. OSI modelinden TCP/IP mimarisine kadar uzanan bu yolculukta veri paketlerinin nasıl yol bulduğunu inceleyeceğiz.'),
(2, N'https://images.unsplash.com/photo-1498050108023-c5249f4df085?w=600', 1, 2, N'Bölüm 2: Switch ve Router yapılandırmaları. Cihazların MAC adresleri ile paketleri nasıl yönlendirdiğini anlamak, yerel alan ağlarının (LAN) temelidir.'),
(3, N'https://images.unsplash.com/photo-1518770660439-4636190af475?w=600', 1, 3, N'IPv4 ve IPv6 protokollerinin kıyaslanması: Neden yeni bir adresleme modeline ihtiyaç duyduk? Güvenlik protokollerinin entegrasyonu.'),
(4, N'https://images.unsplash.com/photo-1563214157-9dbf9df35e61?w=600', 2, 1, N'Osmanlı dönemi el sanatları, Orta Asya, Selçuklu ve İslam motiflerinin mükemmel bir sentezi olarak karşımıza çıkar. Çini, hat ve ebru sanatları...'),
(5, N'https://images.unsplash.com/photo-1574620800171-86ebf4b16cb6?w=600', 2, 2, N'Çini sanatında kullanılan kobalt mavisi ve turkuaz renkleri, özellikle İznik çinilerinde zirveye ulaşmıştır. Desenler sadece süsleme değil, aynı zamanda felsefi mesajlar içerir.');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'ImageUrl', N'LibraryBookId', N'PageNumber', N'TextContent') AND [object_id] = OBJECT_ID(N'[LibraryBookPages]'))
    SET IDENTITY_INSERT [LibraryBookPages] OFF;

CREATE INDEX [IX_LibraryBookPages_LibraryBookId] ON [LibraryBookPages] ([LibraryBookId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260507094220_AddCategoryAndPdfUrlToLibrary', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
DELETE FROM [GalleryComments]
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryComments]
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 25;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 26;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 27;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 28;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 29;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 30;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 31;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 32;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 33;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 34;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 35;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 36;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 37;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 38;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 39;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 40;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 41;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 42;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 43;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 44;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 45;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 46;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 47;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 48;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 49;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 50;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 51;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 52;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 53;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 54;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 55;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 56;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 57;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 58;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 59;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 60;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 61;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 62;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 63;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 64;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 65;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 66;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 67;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 68;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 69;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 70;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 71;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 72;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 73;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 74;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 75;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 76;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 77;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 78;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 79;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 80;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 81;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 82;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 83;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 84;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 85;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 86;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 87;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 88;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 89;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 90;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 91;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 92;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 93;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 94;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 95;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 96;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 97;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 98;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 100;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 101;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 102;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 103;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 104;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 105;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 106;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 107;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 108;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 109;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 110;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 111;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 112;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 113;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 114;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 115;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 116;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 117;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 118;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 119;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 120;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 121;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 122;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 123;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 124;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 125;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 126;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 127;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 128;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 129;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 130;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 131;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 132;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 133;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 134;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 135;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 136;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 137;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 138;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 139;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 140;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 141;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 142;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 143;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 144;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 145;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 146;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 147;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 148;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 149;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 150;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 151;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 152;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 153;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 154;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 155;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 156;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 157;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 158;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 159;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 160;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 161;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 162;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 163;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 164;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 165;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 166;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 167;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 168;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 169;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 170;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 171;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 172;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 173;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 174;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 175;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 176;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 177;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 178;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 179;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 180;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 181;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 182;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 183;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 184;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 185;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 186;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 187;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 188;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 189;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 190;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 191;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 192;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 193;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 194;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 195;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 196;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 197;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 198;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 199;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 200;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 201;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 202;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 203;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 204;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 205;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 206;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 207;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 208;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 209;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 210;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 211;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 212;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 213;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 214;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 215;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 216;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 217;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 218;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 219;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 220;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 221;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 222;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 223;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 224;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 225;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 226;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 227;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 228;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 229;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 230;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 231;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 232;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 233;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 234;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 235;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 236;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 237;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 238;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 239;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 240;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 241;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 242;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 243;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 244;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 245;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 246;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 247;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 248;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 249;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 250;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 251;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 252;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 253;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 254;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 255;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 256;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 257;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 258;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 259;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 260;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 261;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 262;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 263;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 264;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 265;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 266;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 267;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 268;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 269;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 270;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 271;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 272;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 273;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 274;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 275;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 276;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 277;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 278;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 279;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 280;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 281;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 282;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 283;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 284;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 285;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 286;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 287;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 288;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 289;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 290;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 291;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 292;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 293;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 294;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 295;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 296;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 297;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 298;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 299;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 300;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 301;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 302;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 303;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 304;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 305;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 306;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 307;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 308;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 309;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 310;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 311;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 312;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 313;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 314;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 315;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 316;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 317;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 318;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 319;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 320;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 321;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 322;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 323;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 324;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 325;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 326;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 327;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 328;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 329;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 330;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 331;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 332;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 333;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 334;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 335;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 336;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 337;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 338;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 339;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 340;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 341;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 342;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 343;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 344;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 345;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 346;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 347;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 348;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 349;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 350;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 351;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 352;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 353;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 354;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 355;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 356;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 357;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 358;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 359;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 360;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 361;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 362;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 363;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 364;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 365;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 366;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 367;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 368;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 369;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 370;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 371;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 372;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 373;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 374;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 375;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 376;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 377;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 378;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 379;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 380;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 381;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 382;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 383;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 384;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 385;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 386;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 387;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 388;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 389;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 390;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 391;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 392;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 393;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 394;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 395;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 396;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 397;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 398;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 399;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 400;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 401;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 402;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 403;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 404;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 405;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 406;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 407;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 408;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 409;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 410;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 411;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 412;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 413;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 414;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 415;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 416;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 417;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 418;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 419;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 420;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 421;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 422;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 423;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 424;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 425;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 426;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 427;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 428;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 429;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 430;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 431;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 432;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 433;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 434;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 435;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 436;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 437;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 438;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 439;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 440;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 441;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 442;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 443;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 444;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 445;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 446;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 447;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 448;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 449;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 450;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 451;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 452;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 453;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 454;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 455;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 456;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 457;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 458;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 459;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 460;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 461;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 462;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 463;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 464;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 465;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 466;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 467;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 468;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 469;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 470;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 471;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 472;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 473;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 474;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 475;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 476;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 477;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 478;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 479;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 480;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 481;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 482;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 483;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 484;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 485;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 486;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 487;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 488;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 489;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 490;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 491;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 492;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 493;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 494;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 495;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 496;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 497;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 498;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 499;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 500;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 501;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 502;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 503;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 504;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 505;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 506;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 507;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 508;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 509;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 510;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 511;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 512;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 513;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 514;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 515;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 516;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 517;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 518;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 519;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 520;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 521;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 522;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 523;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 524;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 525;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 526;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 527;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 528;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 529;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 530;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 531;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 532;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 533;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 534;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 535;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 536;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 537;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 538;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 539;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 540;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 541;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 542;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 543;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 544;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 545;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 546;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 547;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 548;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 549;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 550;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 551;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 552;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 553;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 554;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 555;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 556;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 557;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 558;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 559;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 560;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 561;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 562;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 563;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 564;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 565;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 566;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 567;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 568;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 569;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 570;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 571;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 572;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 573;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 574;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 575;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 576;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 577;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 578;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 579;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 580;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 581;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 582;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 583;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 584;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 585;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 586;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 587;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 588;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 589;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 590;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 591;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 592;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 593;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 594;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 595;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 596;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 597;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 598;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 599;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 600;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 601;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 602;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 603;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 604;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 605;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 606;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 607;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 608;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 609;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 610;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 611;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 612;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 613;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 614;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 615;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 616;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 617;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 618;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 619;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 620;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 621;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 622;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 623;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 624;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 625;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 626;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 627;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 628;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 629;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 630;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 631;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 632;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 633;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 634;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 635;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 636;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 637;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 638;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 639;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 640;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 641;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 642;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 643;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 644;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 645;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 646;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 647;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 648;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 649;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 650;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 651;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 652;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 653;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 654;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 655;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 656;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 657;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 658;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 659;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 660;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 661;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 662;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 663;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 664;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 665;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 666;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 667;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 668;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 669;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 670;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 671;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 672;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 673;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 674;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 675;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 676;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 677;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 678;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 679;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 680;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 681;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 682;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 683;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 684;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 685;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 686;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 687;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 688;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 689;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 690;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 691;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 692;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 693;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 694;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 695;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 696;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 697;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 698;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 699;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 700;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 701;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 702;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 703;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 704;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 705;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 706;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 707;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 708;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 709;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 710;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 711;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 712;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 713;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 714;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 715;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 716;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 717;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 718;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 719;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 720;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 721;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 722;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 723;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 724;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 725;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 726;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 727;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 728;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 729;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 730;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 731;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 732;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 733;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 734;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 735;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 736;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 737;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 738;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 739;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 740;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 741;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 742;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 743;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 744;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 745;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 746;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 747;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 748;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 749;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 750;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 751;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 752;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 753;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 754;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 755;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 756;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 757;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 758;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 759;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 760;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 761;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 762;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 763;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 764;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 765;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 766;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 767;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 768;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 769;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 770;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 771;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 772;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 773;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 774;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 775;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 776;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 777;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 778;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 779;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 780;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 781;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 782;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 783;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 784;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 785;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 786;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 787;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 788;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 789;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 790;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 791;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 792;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 793;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 794;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 795;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 796;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 797;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 798;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 799;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 800;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 801;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 802;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 803;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 804;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 805;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 806;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 807;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 808;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 809;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 810;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 811;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 812;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 813;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 814;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 815;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 816;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 817;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 818;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 819;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 820;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 821;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 822;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 823;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 824;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 825;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 826;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 827;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 828;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 829;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 830;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 831;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 832;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 833;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 834;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 835;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 836;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 837;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 838;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 839;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 840;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 841;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 842;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 843;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 844;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 845;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 846;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 847;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 848;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 849;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 850;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 851;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 852;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 853;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 854;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 855;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 856;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 857;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 858;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 859;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 860;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 861;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 862;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 863;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 864;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 865;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 866;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 867;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 868;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 869;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 870;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 871;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 872;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 873;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 874;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 875;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 876;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 877;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 878;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 879;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 880;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 881;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 882;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 883;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 884;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 885;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 886;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 887;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 888;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 889;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 890;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 891;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 892;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 893;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 894;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 895;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 896;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 897;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 898;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 899;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 900;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 901;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 902;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 903;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 904;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 905;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 906;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 907;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 908;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 909;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 910;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 911;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 912;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 913;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 914;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 915;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 916;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 917;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 918;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 919;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 920;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 921;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 922;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 923;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 924;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 925;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 926;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 927;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 928;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 929;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 930;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 931;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 932;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 933;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 934;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 935;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 936;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 937;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 938;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 939;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 940;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 941;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 942;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 943;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 944;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 945;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 946;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 947;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 948;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 949;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 950;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 951;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 952;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 953;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 954;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 955;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 956;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 957;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 958;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 959;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 960;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 961;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 962;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 963;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 964;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 965;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 966;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 967;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 968;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 969;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 970;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 971;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 972;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 973;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 974;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 975;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 976;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 977;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 978;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 979;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 980;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 981;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 982;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 983;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 984;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 985;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 986;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 987;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 988;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 989;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 990;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 991;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 992;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 993;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 994;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 995;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 996;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 997;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 998;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 999;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1000;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1001;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1002;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1003;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1004;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1005;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1006;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1007;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1008;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1009;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1010;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1011;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1012;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1013;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1014;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1015;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1016;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1017;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1018;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1019;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1020;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1021;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1022;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1023;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1024;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1025;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1026;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1027;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1028;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1029;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1030;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1031;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1032;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1033;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1034;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1035;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1036;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1037;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1038;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1039;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1040;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1041;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1042;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1043;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1044;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1045;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1046;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1047;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1048;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1049;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1050;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1051;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1052;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1053;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1054;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1055;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1056;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1057;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1058;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1059;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1060;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1061;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1062;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1063;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1064;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1065;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1066;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1067;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1068;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1069;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1070;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1071;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1072;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1073;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1074;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1075;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1076;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1077;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1078;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1079;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1080;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1081;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1082;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1083;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1084;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1085;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1086;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1087;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1088;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1089;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1090;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1091;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1092;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1093;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1094;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1095;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1096;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1097;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1098;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1099;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1100;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1101;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1102;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1103;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1104;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1105;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1106;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1107;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1108;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1109;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1110;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1111;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1112;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1113;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1114;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1115;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1116;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1117;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1118;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1119;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1120;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1121;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1122;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1123;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1124;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1125;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1126;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1127;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1128;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1129;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1130;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1131;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1132;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1133;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1134;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1135;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1136;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1137;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1138;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1139;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1140;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1141;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1142;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1143;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1144;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1145;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1146;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1147;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1148;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1149;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1150;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1151;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1152;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1153;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1154;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1155;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1156;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1157;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1158;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1159;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1160;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1161;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1162;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1163;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1164;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1165;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1166;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1167;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1168;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1169;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1170;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1171;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1172;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1173;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1174;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1175;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1176;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1177;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1178;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1179;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1180;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1181;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1182;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1183;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1184;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1185;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1186;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1187;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1188;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1189;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1190;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1191;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1192;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1193;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1194;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1195;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1196;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1197;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1198;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1199;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1200;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1201;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1202;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1203;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1204;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1205;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1206;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1207;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1208;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1209;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1210;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1211;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1212;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1213;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1214;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1215;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1216;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1217;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1218;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1219;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1220;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1221;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1222;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1223;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1224;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1225;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1226;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1227;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1228;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1229;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1230;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1231;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1232;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1233;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1234;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1235;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1236;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1237;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1238;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1239;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1240;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1241;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1242;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1243;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1244;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1245;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1246;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1247;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1248;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1249;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1250;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1251;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1252;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1253;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1254;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1255;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1256;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1257;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1258;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1259;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1260;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1261;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1262;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1263;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1264;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1265;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1266;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1267;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1268;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1269;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1270;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1271;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1272;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1273;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1274;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1275;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1276;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1277;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1278;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1279;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1280;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1281;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1282;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1283;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1284;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1285;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1286;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1287;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1288;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1289;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1290;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1291;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1292;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1293;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1294;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1295;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1296;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1297;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1298;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1299;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1300;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1301;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1302;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1303;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1304;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1305;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1306;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1307;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1308;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1309;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1310;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1311;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1312;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1313;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1314;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1315;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1316;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1317;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1318;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1319;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1320;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1321;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1322;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1323;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1324;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1325;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1326;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1327;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1328;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1329;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1330;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1331;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1332;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1333;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1334;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1335;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1336;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1337;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1338;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1339;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1340;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1341;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1342;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1343;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1344;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1345;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1346;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1347;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1348;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1349;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1350;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1351;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1352;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1353;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1354;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1355;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1356;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1357;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1358;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1359;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1360;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1361;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1362;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1363;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1364;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1365;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1366;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1367;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1368;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1369;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1370;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1371;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1372;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1373;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1374;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1375;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1376;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1377;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1378;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1379;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1380;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1381;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1382;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1383;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1384;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1385;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1386;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1387;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1388;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1389;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1390;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1391;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1392;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1393;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1394;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1395;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1396;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1397;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1398;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1399;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1400;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1401;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1402;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1403;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1404;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1405;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1406;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1407;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1408;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1409;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1410;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1411;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1412;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1413;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1414;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1415;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1416;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1417;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1418;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1419;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1420;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1421;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1422;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1423;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1424;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1425;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1426;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1427;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1428;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1429;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1430;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1431;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1432;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1433;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1434;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1435;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1436;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1437;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1438;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1439;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1440;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1441;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1442;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1443;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1444;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1445;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1446;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1447;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1448;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1449;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1450;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1451;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1452;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1453;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1454;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1455;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1456;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1457;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1458;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1459;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1460;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1461;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1462;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1463;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1464;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1465;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1466;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1467;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1468;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1469;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1470;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1471;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1472;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1473;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1474;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1475;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1476;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1477;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1478;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1479;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1480;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1481;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1482;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1483;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1484;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1485;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1486;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1487;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1488;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1489;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1490;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1491;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1492;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1493;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1494;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1495;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1496;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1497;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1498;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1499;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1500;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1501;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1502;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1503;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1504;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1505;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1506;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1507;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1508;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1509;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1510;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1511;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1512;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1513;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1514;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1515;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1516;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1517;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1518;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1519;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1520;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1521;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1522;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1523;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1524;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1525;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1526;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1527;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1528;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1529;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1530;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1531;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1532;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1533;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1534;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1535;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1536;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1537;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1538;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1539;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1540;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1541;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1542;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1543;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1544;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1545;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1546;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1547;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1548;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1549;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1550;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1551;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1552;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1553;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1554;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1555;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1556;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1557;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1558;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1559;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1560;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1561;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1562;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1563;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1564;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1565;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1566;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1567;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1568;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1569;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1570;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1571;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1572;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1573;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1574;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1575;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1576;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1577;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1578;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1579;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1580;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1581;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1582;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1583;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1584;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1585;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1586;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1587;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1588;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1589;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1590;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1591;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1592;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1593;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1594;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1595;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1596;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1597;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1598;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1599;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1600;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1601;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1602;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1603;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1604;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1605;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1606;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1607;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1608;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1609;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1610;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1611;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1612;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1613;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1614;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1615;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1616;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1617;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1618;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1619;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1620;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1621;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1622;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1623;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1624;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1625;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1626;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1627;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1628;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1629;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1630;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1631;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1632;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1633;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1634;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1635;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1636;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1637;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1638;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1639;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1640;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1641;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1642;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1643;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1644;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1645;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1646;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1647;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1648;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1649;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1650;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1651;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1652;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1653;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1654;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1655;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1656;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1657;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1658;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1659;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1660;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1661;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1662;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1663;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1664;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1665;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1666;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1667;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1668;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1669;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1670;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1671;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1672;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1673;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1674;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1675;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1676;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1677;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1678;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1679;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1680;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1681;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1682;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1683;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1684;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1685;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1686;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1687;
SELECT @@ROWCOUNT;


DELETE FROM [GalleryLikes]
WHERE [Id] = 1688;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


DELETE FROM [NewsComments]
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 25;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 26;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 27;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 28;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 29;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 30;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 31;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 32;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 33;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 34;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 35;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 36;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 37;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 38;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 39;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 40;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 41;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 42;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 43;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 44;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 45;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 46;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 47;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 48;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 49;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 50;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 51;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 52;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 53;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 54;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 55;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 56;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 57;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 58;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 59;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 60;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 61;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 62;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 63;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 64;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 65;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 66;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 67;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 68;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 69;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 70;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 71;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 72;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 73;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 74;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 75;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 76;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 77;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 78;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 79;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 80;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 81;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 82;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 83;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 84;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 85;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 86;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 87;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 88;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 89;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 90;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 91;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 92;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 93;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 94;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 95;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 96;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 97;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 98;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 100;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 101;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 102;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 103;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 104;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 105;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 106;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 107;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 108;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 109;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 110;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 111;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 112;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 113;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 114;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 115;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 116;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 117;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 118;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 119;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 120;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 121;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 122;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 123;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 124;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 125;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 126;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 127;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 128;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 129;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 130;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 131;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 132;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 133;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 134;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 135;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 136;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 137;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 138;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 139;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 140;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 141;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 142;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 143;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 144;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 145;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 146;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 147;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 148;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 149;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 150;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 151;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 152;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 153;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 154;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 155;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 156;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 157;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 158;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 159;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 160;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 161;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 162;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 163;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 164;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 165;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 166;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 167;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 168;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 169;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 170;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 171;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 172;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 173;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 174;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 175;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 176;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 177;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 178;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 179;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 180;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 181;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 182;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 183;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 184;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 185;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 186;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 187;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 188;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 189;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 190;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 191;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 192;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 193;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 194;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 195;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 196;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 197;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 198;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 199;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 200;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 201;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 202;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 203;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 204;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 205;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 206;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 207;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 208;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 209;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 210;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 211;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 212;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 213;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 214;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 215;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 216;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 217;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 218;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 219;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 220;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 221;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 222;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 223;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 224;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 225;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 226;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 227;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 228;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 229;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 230;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 231;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 232;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 233;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 234;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 235;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 236;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 237;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 238;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 239;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 240;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 241;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 242;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 243;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 244;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 245;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 246;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 247;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 248;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 249;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 250;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 251;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 252;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 253;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 254;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 255;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 256;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 257;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 258;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 259;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 260;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 261;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 262;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 263;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 264;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 265;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 266;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 267;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 268;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 269;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 270;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 271;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 272;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 273;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 274;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 275;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 276;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 277;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 278;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 279;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 280;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 281;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 282;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 283;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 284;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 285;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 286;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 287;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 288;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 289;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 290;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 291;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 292;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 293;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 294;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 295;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 296;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 297;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 298;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 299;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 300;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 301;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 302;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 303;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 304;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 305;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 306;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 307;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 308;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 309;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 310;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 311;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 312;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 313;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 314;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 315;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 316;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 317;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 318;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 319;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 320;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 321;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 322;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 323;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 324;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 325;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 326;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 327;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 328;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 329;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 330;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 331;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 332;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 333;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 334;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 335;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 336;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 337;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 338;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 339;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 340;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 341;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 342;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 343;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 344;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 345;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 346;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 347;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 348;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 349;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 350;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 351;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 352;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 353;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 354;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 355;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 356;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 357;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 358;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 359;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 360;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 361;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 362;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 363;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 364;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 365;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 366;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 367;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 368;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 369;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 370;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 371;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 372;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 373;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 374;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 375;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 376;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 377;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 378;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 379;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 380;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 381;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 382;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 383;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 384;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 385;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 386;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 387;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 388;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 389;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 390;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 391;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 392;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 393;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 394;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 395;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 396;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 397;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 398;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 399;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 400;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 401;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 402;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 403;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 404;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 405;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 406;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 407;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 408;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 409;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 410;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 411;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 412;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 413;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 414;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 415;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 416;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 417;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 418;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 419;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 420;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 421;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 422;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 423;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 424;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 425;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 426;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 427;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 428;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 429;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 430;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 431;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 432;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 433;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 434;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 435;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 436;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 437;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 438;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 439;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 440;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 441;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 442;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 443;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 444;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 445;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 446;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 447;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 448;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 449;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 450;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 451;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 452;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 453;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 454;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 455;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 456;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 457;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 458;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 459;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 460;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 461;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 462;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 463;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 464;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 465;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 466;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 467;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 468;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 469;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 470;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 471;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 472;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 473;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 474;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 475;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 476;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 477;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 478;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 479;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 480;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 481;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 482;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 483;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 484;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 485;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 486;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 487;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 488;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 489;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 490;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 491;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 492;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 493;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 494;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 495;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 496;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 497;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 498;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 499;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 500;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 501;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 502;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 503;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 504;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 505;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 506;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 507;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 508;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 509;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 510;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 511;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 512;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 513;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 514;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 515;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 516;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 517;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 518;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 519;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 520;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 521;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 522;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 523;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 524;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 525;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 526;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 527;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 528;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 529;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 530;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 531;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 532;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 533;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 534;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 535;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 536;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 537;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 538;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 539;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 540;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 541;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 542;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 543;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 544;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 545;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 546;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 547;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 548;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 549;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 550;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 551;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 552;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 553;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 554;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 555;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 556;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 557;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 558;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 559;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 560;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 561;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 562;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 563;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 564;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 565;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 566;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 567;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 568;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 569;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 570;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 571;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 572;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 573;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 574;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 575;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 576;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 577;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 578;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 579;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 580;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 581;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 582;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 583;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 584;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 585;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 586;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 587;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 588;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 589;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 590;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 591;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 592;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 593;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 594;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 595;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 596;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 597;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 598;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 599;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 600;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 601;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 602;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 603;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 604;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 605;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 606;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 607;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 608;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 609;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 610;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 611;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 612;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 613;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 614;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 615;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 616;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 617;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 618;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 619;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 620;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 621;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 622;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 623;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 624;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 625;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 626;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 627;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 628;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 629;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 630;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 631;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 632;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 633;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 634;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 635;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 636;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 637;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 638;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 639;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 640;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 641;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 642;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 643;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 644;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 645;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 646;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 647;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 648;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 649;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 650;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 651;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 652;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 653;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 654;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 655;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 656;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 657;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 658;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 659;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 660;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 661;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 662;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 663;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 664;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 665;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 666;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 667;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 668;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 669;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 670;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 671;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 672;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 673;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 674;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 675;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 676;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 677;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 678;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 679;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 680;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 681;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 682;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 683;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 684;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 685;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 686;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 687;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 688;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 689;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 690;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 691;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 692;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 693;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 694;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 695;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 696;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 697;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 698;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 699;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 700;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 701;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 702;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 703;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 704;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 705;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 706;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 707;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 708;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 709;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 710;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 711;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 712;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 713;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 714;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 715;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 716;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 717;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 718;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 719;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 720;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 721;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 722;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 723;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 724;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 725;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 726;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 727;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 728;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 729;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 730;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 731;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 732;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 733;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 734;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 735;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 736;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 737;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 738;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 739;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 740;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 741;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 742;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 743;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 744;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 745;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 746;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 747;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 748;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 749;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 750;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 751;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 752;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 753;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 754;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 755;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 756;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 757;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 758;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 759;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 760;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 761;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 762;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 763;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 764;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 765;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 766;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 767;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 768;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 769;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 770;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 771;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 772;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 773;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 774;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 775;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 776;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 777;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 778;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 779;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 780;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 781;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 782;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 783;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 784;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 785;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 786;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 787;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 788;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 789;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 790;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 791;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 792;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 793;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 794;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 795;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 796;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 797;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 798;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 799;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 800;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 801;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 802;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 803;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 804;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 805;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 806;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 807;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 808;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 809;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 810;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 811;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 812;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 813;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 814;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 815;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 816;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 817;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 818;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 819;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 820;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 821;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 822;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 823;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 824;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 825;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 826;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 827;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 828;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 829;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 830;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 831;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 832;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 833;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 834;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 835;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 836;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 837;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 838;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 839;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 840;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 841;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 842;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 843;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 844;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 845;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 846;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 847;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 848;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 849;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 850;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 851;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 852;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 853;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 854;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 855;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 856;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 857;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 858;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 859;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 860;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 861;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 862;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 863;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 864;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 865;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 866;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 867;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 868;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 869;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 870;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 871;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 872;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 873;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 874;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 875;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 876;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 877;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 878;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 879;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 880;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 881;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 882;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 883;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 884;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 885;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 886;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 887;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 888;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 889;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 890;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 891;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 892;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 893;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 894;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 895;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 896;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 897;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 898;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 899;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 900;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 901;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 902;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 903;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 904;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 905;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 906;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 907;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 908;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 909;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 910;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 911;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 912;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 913;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 914;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 915;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 916;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 917;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 918;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 919;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 920;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 921;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 922;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 923;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 924;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 925;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 926;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 927;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 928;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 929;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 930;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 931;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 932;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 933;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 934;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 935;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 936;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 937;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 938;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 939;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 940;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 941;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 942;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 943;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 944;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 945;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 946;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 947;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 948;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 949;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 950;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 951;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 952;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 953;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 954;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 955;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 956;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 957;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 958;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 959;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 960;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 961;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 962;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 963;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 964;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 965;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 966;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 967;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 968;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 969;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 970;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 971;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 972;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 973;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 974;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 975;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 976;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 977;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 978;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 979;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 980;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 981;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 982;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 983;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 984;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 985;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 986;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 987;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 988;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 989;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 990;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 991;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 992;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 993;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 994;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 995;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 996;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 997;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 998;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 999;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1000;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1001;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1002;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1003;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1004;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1005;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1006;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1007;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1008;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1009;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1010;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1011;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1012;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1013;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1014;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1015;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1016;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1017;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1018;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1019;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1020;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1021;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1022;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1023;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1024;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1025;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1026;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1027;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1028;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1029;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1030;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1031;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1032;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1033;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1034;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1035;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1036;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1037;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1038;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1039;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1040;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1041;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1042;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1043;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1044;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1045;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1046;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1047;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1048;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1049;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1050;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1051;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1052;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1053;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1054;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1055;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1056;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1057;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1058;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1059;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1060;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1061;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1062;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1063;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1064;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1065;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1066;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1067;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1068;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1069;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1070;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1071;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1072;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1073;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1074;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1075;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1076;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1077;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1078;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1079;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1080;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1081;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1082;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1083;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1084;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1085;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1086;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1087;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1088;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1089;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1090;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1091;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1092;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1093;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1094;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1095;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1096;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1097;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1098;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1099;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1100;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1101;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1102;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1103;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1104;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1105;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1106;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1107;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1108;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1109;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1110;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1111;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1112;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1113;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1114;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1115;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1116;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1117;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1118;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1119;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1120;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1121;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1122;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1123;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1124;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1125;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1126;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1127;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1128;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1129;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1130;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1131;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1132;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1133;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1134;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1135;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1136;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1137;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1138;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1139;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1140;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1141;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1142;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1143;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1144;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1145;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1146;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1147;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1148;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1149;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1150;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1151;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1152;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1153;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1154;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1155;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1156;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1157;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1158;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1159;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1160;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1161;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1162;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1163;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1164;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1165;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1166;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1167;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1168;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1169;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1170;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1171;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1172;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1173;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1174;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1175;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1176;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1177;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1178;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1179;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1180;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1181;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1182;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1183;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1184;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1185;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1186;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1187;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1188;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1189;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1190;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1191;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1192;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1193;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1194;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1195;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1196;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1197;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1198;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1199;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1200;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1201;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1202;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1203;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1204;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1205;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1206;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1207;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1208;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1209;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1210;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1211;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1212;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1213;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1214;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1215;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1216;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1217;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1218;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1219;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1220;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1221;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1222;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1223;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1224;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1225;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1226;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1227;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1228;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1229;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1230;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1231;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1232;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1233;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1234;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1235;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1236;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1237;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1238;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1239;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1240;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1241;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1242;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1243;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1244;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1245;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1246;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1247;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1248;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1249;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1250;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1251;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1252;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1253;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1254;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1255;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1256;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1257;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1258;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1259;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1260;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1261;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1262;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1263;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1264;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1265;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1266;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1267;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1268;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1269;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1270;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1271;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1272;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1273;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1274;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1275;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1276;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1277;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1278;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1279;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1280;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1281;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1282;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1283;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1284;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1285;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1286;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1287;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1288;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1289;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1290;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1291;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1292;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1293;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1294;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1295;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1296;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1297;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1298;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1299;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1300;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1301;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1302;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1303;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1304;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1305;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1306;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1307;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1308;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1309;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1310;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1311;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1312;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1313;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1314;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1315;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1316;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1317;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1318;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1319;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1320;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1321;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1322;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1323;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1324;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1325;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1326;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1327;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1328;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1329;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1330;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1331;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1332;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1333;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1334;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1335;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1336;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1337;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1338;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1339;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1340;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1341;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1342;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1343;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1344;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1345;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1346;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1347;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1348;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1349;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1350;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1351;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1352;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1353;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1354;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1355;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1356;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1357;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1358;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1359;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1360;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1361;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1362;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1363;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1364;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1365;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1366;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1367;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1368;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1369;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1370;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1371;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1372;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1373;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1374;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1375;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1376;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1377;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1378;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1379;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1380;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1381;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1382;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1383;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1384;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1385;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1386;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1387;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1388;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1389;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1390;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1391;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1392;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1393;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1394;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1395;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1396;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1397;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1398;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1399;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1400;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1401;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1402;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1403;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1404;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1405;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1406;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1407;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1408;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1409;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1410;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1411;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1412;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1413;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1414;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1415;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1416;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1417;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1418;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1419;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1420;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1421;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1422;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1423;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1424;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1425;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1426;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1427;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1428;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1429;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1430;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1431;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1432;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1433;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1434;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1435;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1436;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1437;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1438;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1439;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1440;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1441;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1442;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1443;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1444;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1445;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1446;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1447;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1448;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1449;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1450;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1451;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1452;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1453;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1454;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1455;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1456;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1457;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1458;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1459;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1460;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1461;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1462;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1463;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1464;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1465;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1466;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1467;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1468;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1469;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1470;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1471;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1472;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1473;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1474;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1475;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1476;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1477;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1478;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1479;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1480;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1481;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1482;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1483;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1484;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1485;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1486;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1487;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1488;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1489;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1490;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1491;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1492;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1493;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1494;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1495;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1496;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1497;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1498;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1499;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1500;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1501;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1502;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1503;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1504;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1505;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1506;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1507;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1508;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1509;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1510;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1511;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1512;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1513;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1514;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1515;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1516;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1517;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1518;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1519;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1520;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1521;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1522;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1523;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1524;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1525;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1526;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1527;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1528;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1529;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1530;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1531;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1532;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1533;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1534;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1535;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1536;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1537;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1538;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1539;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1540;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1541;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1542;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1543;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1544;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1545;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1546;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1547;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1548;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1549;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1550;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1551;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1552;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1553;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1554;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1555;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1556;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1557;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1558;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1559;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1560;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1561;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1562;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1563;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1564;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1565;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1566;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1567;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1568;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1569;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1570;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1571;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1572;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1573;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1574;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1575;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1576;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1577;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1578;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1579;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1580;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1581;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1582;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1583;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1584;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1585;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1586;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1587;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1588;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1589;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1590;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1591;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1592;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1593;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1594;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1595;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1596;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1597;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1598;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1599;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1600;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1601;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1602;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1603;
SELECT @@ROWCOUNT;


DELETE FROM [NewsLikes]
WHERE [Id] = 1604;
SELECT @@ROWCOUNT;


DECLARE @var nvarchar(max);
SELECT @var = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ExhibitionItems]') AND [c].[name] = N'ExternalLink');
IF @var IS NOT NULL EXEC(N'ALTER TABLE [ExhibitionItems] DROP CONSTRAINT ' + @var + ';');
ALTER TABLE [ExhibitionItems] DROP COLUMN [ExternalLink];

DECLARE @var1 nvarchar(max);
SELECT @var1 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[ExhibitionItems]') AND [c].[name] = N'TechDetails');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [ExhibitionItems] DROP CONSTRAINT ' + @var1 + ';');
ALTER TABLE [ExhibitionItems] DROP COLUMN [TechDetails];

ALTER TABLE [News] ADD [ViewCount] int NOT NULL DEFAULT 0;

ALTER TABLE [LibraryBooks] ADD [PageCount] int NULL;

ALTER TABLE [LibraryBooks] ADD [PreviewLink] nvarchar(max) NULL;

ALTER TABLE [LibraryBooks] ADD [PublishedDate] nvarchar(max) NULL;

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T14:54:47.9965127+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T14:54:47.9967386+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T14:54:47.9967391+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T14:54:47.9967395+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T14:54:47.9967398+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T14:54:47.9967401+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T14:54:47.9985575+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T14:54:47.9985829+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9960552+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961753+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961758+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961787+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961789+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961791+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961793+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961795+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961797+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961799+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961801+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T14:54:47.9961803+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [LibraryBooks] SET [PageCount] = NULL, [PreviewLink] = N'', [PublishedDate] = N''
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [LibraryBooks] SET [PageCount] = NULL, [PreviewLink] = N'', [PublishedDate] = N''
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [News] SET [ViewCount] = 0
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [News] SET [ViewCount] = 0
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [News] SET [ViewCount] = 0
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [News] SET [ViewCount] = 0
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [News] SET [ViewCount] = 0
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [News] SET [ViewCount] = 0
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [News] SET [ViewCount] = 0
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [News] SET [ViewCount] = 0
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T14:54:47.9983349+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T14:54:47.9983736+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260507115451_AddViewCountToNews', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
ALTER TABLE [TeacherChatMessages] DROP CONSTRAINT [FK_TeacherChatMessages_Instructors_InstructorId];

DECLARE @var2 nvarchar(max);
SELECT @var2 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[News]') AND [c].[name] = N'ViewCount');
IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [News] DROP CONSTRAINT ' + @var2 + ';');
ALTER TABLE [News] DROP COLUMN [ViewCount];

DECLARE @var3 nvarchar(max);
SELECT @var3 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TeacherChatMessages]') AND [c].[name] = N'InstructorId');
IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [TeacherChatMessages] DROP CONSTRAINT ' + @var3 + ';');
ALTER TABLE [TeacherChatMessages] ALTER COLUMN [InstructorId] int NULL;

ALTER TABLE [LibraryBooks] ADD [CourseId] int NULL;

ALTER TABLE [LibraryBooks] ADD [IsCourseNote] bit NOT NULL DEFAULT CAST(0 AS bit);

ALTER TABLE [LibraryBooks] ADD [StarCount] int NOT NULL DEFAULT 0;

ALTER TABLE [LibraryBooks] ADD [StudentId] int NULL;

ALTER TABLE [ExhibitionItems] ADD [StudentId] int NULL;

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T19:53:29.3820384+03:00', [StudentId] = NULL
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T19:53:29.3822961+03:00', [StudentId] = NULL
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T19:53:29.3822968+03:00', [StudentId] = NULL
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T19:53:29.3822972+03:00', [StudentId] = NULL
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T19:53:29.3822975+03:00', [StudentId] = NULL
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T19:53:29.3822978+03:00', [StudentId] = NULL
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T19:53:29.3842974+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T19:53:29.3843196+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3812737+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815370+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815383+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815389+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815426+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815429+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815433+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815436+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815439+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815442+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815446+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T19:53:29.3815449+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [LibraryBooks] SET [CourseId] = NULL, [IsCourseNote] = CAST(0 AS bit), [StarCount] = 0, [StudentId] = NULL
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [LibraryBooks] SET [CourseId] = NULL, [IsCourseNote] = CAST(0 AS bit), [StarCount] = 0, [StudentId] = NULL
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T19:53:29.3841143+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T19:53:29.3841431+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


CREATE INDEX [IX_LibraryBooks_CourseId] ON [LibraryBooks] ([CourseId]);

CREATE INDEX [IX_LibraryBooks_StudentId] ON [LibraryBooks] ([StudentId]);

CREATE INDEX [IX_ExhibitionItems_StudentId] ON [ExhibitionItems] ([StudentId]);

ALTER TABLE [ExhibitionItems] ADD CONSTRAINT [FK_ExhibitionItems_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]);

ALTER TABLE [LibraryBooks] ADD CONSTRAINT [FK_LibraryBooks_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]);

ALTER TABLE [LibraryBooks] ADD CONSTRAINT [FK_LibraryBooks_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]);

ALTER TABLE [TeacherChatMessages] ADD CONSTRAINT [FK_TeacherChatMessages_Instructors_InstructorId] FOREIGN KEY ([InstructorId]) REFERENCES [Instructors] ([Id]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260507165334_AddStudentRelationsAndCourseNotes', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [IsApproved] bit NOT NULL DEFAULT CAST(0 AS bit);

ALTER TABLE [Instructors] ADD [IsApproved] bit NOT NULL DEFAULT CAST(0 AS bit);

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T21:57:15.2804543+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T21:57:15.2806865+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T21:57:15.2806872+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T21:57:15.2806875+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T21:57:15.2806878+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-07T21:57:15.2806881+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-04T21:57:15.2823129+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T21:57:15.2823344+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2799899+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801220+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801225+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801228+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801247+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801249+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801251+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801252+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801254+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801256+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801257+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-07T21:57:15.2801259+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(1 AS bit)
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [LibraryBooks] SET [Category] = N'Yazılım', [IsCourseNote] = CAST(1 AS bit), [StarCount] = 12
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [LibraryBooks] SET [Author] = N'Prof. Dr. İlber Ortaylı', [Category] = N'Sanat', [IsCourseNote] = CAST(1 AS bit), [StarCount] = 8
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-02T21:57:15.2821334+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-03T21:57:15.2821656+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Students] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260507185718_AddIsApprovedToModels', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
CREATE TABLE [Ideas] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NULL,
    [Description] nvarchar(max) NULL,
    [Category] nvarchar(max) NULL,
    [AuthorName] nvarchar(max) NULL,
    [CreatedAt] datetime2 NOT NULL,
    [Likes] int NOT NULL,
    CONSTRAINT [PK_Ideas] PRIMARY KEY ([Id])
);

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-09T13:58:19.5505255+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-09T13:58:19.5507203+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-09T13:58:19.5507208+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-09T13:58:19.5507212+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-09T13:58:19.5507241+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-09T13:58:19.5507244+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-06T13:58:19.5539718+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-08T13:58:19.5540687+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5501361+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502360+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502364+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502366+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502368+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502370+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502371+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502373+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502379+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502381+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502383+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-09T13:58:19.5502384+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AuthorName', N'Category', N'CreatedAt', N'Description', N'Likes', N'Title') AND [object_id] = OBJECT_ID(N'[Ideas]'))
    SET IDENTITY_INSERT [Ideas] ON;
INSERT INTO [Ideas] ([Id], [AuthorName], [Category], [CreatedAt], [Description], [Likes], [Title])
VALUES (1, N'Betül Gökden', N'Dijitalleşme', '2026-04-29T13:58:19.5547970+03:00', N'Kursiyerlerin ödevlerini takip edebileceği bir mobil uygulama.', 45, N'Dijital Kurs Asistanı'),
(2, N'Mehmet Demir', N'Sanat & Kültür', '2026-05-04T13:58:19.5549343+03:00', N'Köy okullarına gidip çocuklara ebru sanatı öğretecek bir minibüs.', 120, N'Gezici Sanat Atölyesi'),
(3, N'Fatma Çelik', N'Sosyal Sorumluluk', '2026-05-07T13:58:19.5549352+03:00', N'Dikiş nakış kurslarındaki atık kumaşlardan oyuncak yapıp bağışlama.', 88, N'Atık Kumaş Dönüşümü');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'AuthorName', N'Category', N'CreatedAt', N'Description', N'Likes', N'Title') AND [object_id] = OBJECT_ID(N'[Ideas]'))
    SET IDENTITY_INSERT [Ideas] OFF;

UPDATE [NewsComments] SET [CreatedAt] = '2026-05-04T13:58:19.5528011+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T13:58:19.5529521+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Students] SET [Email] = N'betul.gokden@halkegitim.com', [Password] = N'123'
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260509105825_AddIdeaBankV2', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
DROP INDEX [IX_Instructors_CourseId] ON [Instructors];

ALTER TABLE [Students] ADD [EloRating] int NOT NULL DEFAULT 0;

ALTER TABLE [Students] ADD [Points] int NOT NULL DEFAULT 0;

ALTER TABLE [Students] ADD [TotalMatches] int NOT NULL DEFAULT 0;

ALTER TABLE [Students] ADD [Wins] int NOT NULL DEFAULT 0;

CREATE TABLE [AcademicNotes] (
    [Id] int NOT NULL IDENTITY,
    [Title] nvarchar(max) NOT NULL,
    [Content] nvarchar(max) NOT NULL,
    [PdfUrl] nvarchar(max) NULL,
    [CourseId] int NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [InstructorName] nvarchar(max) NULL,
    CONSTRAINT [PK_AcademicNotes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AcademicNotes_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [AcademicTests] (
    [Id] int NOT NULL IDENTITY,
    [TestTitle] nvarchar(max) NOT NULL,
    [CourseId] int NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_AcademicTests] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AcademicTests_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [QuizMatches] (
    [Id] int NOT NULL IDENTITY,
    [StudentId] int NOT NULL,
    [Score] int NOT NULL,
    [CorrectAnswers] int NOT NULL,
    [WrongAnswers] int NOT NULL,
    [MatchDate] datetime2 NOT NULL,
    [AiFeedback] nvarchar(max) NULL,
    [WeakAreas] nvarchar(max) NULL,
    [IsFreeCourseAwarded] bit NOT NULL,
    CONSTRAINT [PK_QuizMatches] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_QuizMatches_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
);

CREATE TABLE [QuizQuestions] (
    [Id] int NOT NULL IDENTITY,
    [QuestionText] nvarchar(max) NULL,
    [OptionA] nvarchar(max) NULL,
    [OptionB] nvarchar(max) NULL,
    [OptionC] nvarchar(max) NULL,
    [OptionD] nvarchar(max) NULL,
    [CorrectAnswer] nvarchar(max) NULL,
    [Difficulty] int NOT NULL,
    [Category] nvarchar(max) NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_QuizQuestions] PRIMARY KEY ([Id])
);

CREATE TABLE [AcademicQuestions] (
    [Id] int NOT NULL IDENTITY,
    [AcademicTestId] int NOT NULL,
    [QuestionText] nvarchar(max) NOT NULL,
    [OptionA] nvarchar(max) NOT NULL,
    [OptionB] nvarchar(max) NOT NULL,
    [OptionC] nvarchar(max) NOT NULL,
    [OptionD] nvarchar(max) NOT NULL,
    [CorrectAnswer] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_AcademicQuestions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AcademicQuestions_AcademicTests_AcademicTestId] FOREIGN KEY ([AcademicTestId]) REFERENCES [AcademicTests] ([Id]) ON DELETE CASCADE
);

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-10T01:28:04.6979187+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-10T01:28:04.6981256+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-10T01:28:04.6981260+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-10T01:28:04.6981264+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-10T01:28:04.6981267+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-10T01:28:04.6981269+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-07T01:28:04.6997646+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-09T01:28:04.6997861+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6975232+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976291+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976295+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976328+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976330+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976332+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976334+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976336+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976337+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976339+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976340+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-10T01:28:04.6976342+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-04-30T01:28:04.6999455+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-05T01:28:04.6999863+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-08T01:28:04.6999867+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-05T01:28:04.6995876+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-06T01:28:04.6996162+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Category', N'CorrectAnswer', N'CreatedAt', N'Difficulty', N'OptionA', N'OptionB', N'OptionC', N'OptionD', N'QuestionText') AND [object_id] = OBJECT_ID(N'[QuizQuestions]'))
    SET IDENTITY_INSERT [QuizQuestions] ON;
INSERT INTO [QuizQuestions] ([Id], [Category], [CorrectAnswer], [CreatedAt], [Difficulty], [OptionA], [OptionB], [OptionC], [OptionD], [QuestionText])
VALUES (1, N'Yazılım', N'C', '2026-05-10T01:28:04.7000560+03:00', 1, N'add()', N'insert()', N'append()', N'push()', N'Python''da liste sonuna eleman eklemek için hangi metod kullanılır?'),
(2, N'Ağ Teknolojileri', N'C', '2026-05-10T01:28:04.7002367+03:00', 1, N'Star', N'Bus', N'Moon', N'Ring', N'Aşağıdakilerden hangisi bir ağ topolojisi değildir?'),
(3, N'El Sanatları', N'A', '2026-05-10T01:28:04.7002371+03:00', 2, N'Kitre', N'Nişasta', N'Tutkal', N'Şeker', N'Geleneksel Ebru sanatında suyun kıvamını artırmak için ne kullanılır?'),
(4, N'Yazılım', N'B', '2026-05-10T01:28:04.7002374+03:00', 1, N'Biyoloji', N'Bilgisayar Bilimi', N'Sosyoloji', N'Fizik', N'Yapay zekada ''Makine Öğrenmesi'' hangi ana dalın altındadır?'),
(5, N'Ağ Teknolojileri', N'C', '2026-05-10T01:28:04.7002376+03:00', 2, N'Ana Sunucu', N'Dış Ağ', N'Lokal Geri Döngü (Loopback)', N'Varsayılan Ağ Geçidi', N'Bir IP adresindeki 127.0.0.1 neyi temsil eder?');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'Category', N'CorrectAnswer', N'CreatedAt', N'Difficulty', N'OptionA', N'OptionB', N'OptionC', N'OptionD', N'QuestionText') AND [object_id] = OBJECT_ID(N'[QuizQuestions]'))
    SET IDENTITY_INSERT [QuizQuestions] OFF;

UPDATE [Students] SET [EloRating] = 1000, [Points] = 0, [TotalMatches] = 0, [Wins] = 0
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


CREATE UNIQUE INDEX [IX_Instructors_CourseId] ON [Instructors] ([CourseId]) WHERE [CourseId] IS NOT NULL;

CREATE INDEX [IX_AcademicNotes_CourseId] ON [AcademicNotes] ([CourseId]);

CREATE INDEX [IX_AcademicQuestions_AcademicTestId] ON [AcademicQuestions] ([AcademicTestId]);

CREATE INDEX [IX_AcademicTests_CourseId] ON [AcademicTests] ([CourseId]);

CREATE INDEX [IX_QuizMatches_StudentId] ON [QuizMatches] ([StudentId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260509222807_FixGamificationAndQuiz', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
CREATE TABLE [Employers] (
    [Id] int NOT NULL IDENTITY,
    [CompanyName] nvarchar(max) NOT NULL,
    [TaxNumber] nvarchar(max) NOT NULL,
    [Sector] nvarchar(max) NULL,
    [AuthorizedPerson] nvarchar(max) NOT NULL,
    [Email] nvarchar(max) NOT NULL,
    [Password] nvarchar(max) NOT NULL,
    [TaxPlatePath] nvarchar(max) NULL,
    [IsApproved] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_Employers] PRIMARY KEY ([Id])
);

CREATE TABLE [SiteLogs] (
    [Id] int NOT NULL IDENTITY,
    [Timestamp] datetime2 NOT NULL,
    [Action] nvarchar(max) NOT NULL,
    [Details] nvarchar(max) NULL,
    [User] nvarchar(max) NULL,
    [IpAddress] nvarchar(max) NULL,
    [Severity] nvarchar(max) NULL,
    CONSTRAINT [PK_SiteLogs] PRIMARY KEY ([Id])
);

CREATE TABLE [JobPostings] (
    [Id] int NOT NULL IDENTITY,
    [EmployerId] int NOT NULL,
    [Title] nvarchar(100) NOT NULL,
    [Description] nvarchar(max) NOT NULL,
    [Requirements] nvarchar(max) NULL,
    [Location] nvarchar(max) NULL,
    [SalaryRange] nvarchar(max) NULL,
    [CreatedAt] datetime2 NOT NULL DEFAULT (GETDATE()),
    [IsActive] bit NOT NULL,
    [IsDeleted] bit NOT NULL,
    [RequiredCategory] nvarchar(max) NULL,
    CONSTRAINT [PK_JobPostings] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_JobPostings_Employers_EmployerId] FOREIGN KEY ([EmployerId]) REFERENCES [Employers] ([Id]) ON DELETE CASCADE
);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260510211911_AddNbh', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [Badges] nvarchar(max) NULL;

ALTER TABLE [Students] ADD [IsAvailableForWork] bit NOT NULL DEFAULT CAST(0 AS bit);

ALTER TABLE [Students] ADD [IsSpotlight] bit NOT NULL DEFAULT CAST(0 AS bit);

ALTER TABLE [Students] ADD [IsVerified] bit NOT NULL DEFAULT CAST(0 AS bit);

ALTER TABLE [Students] ADD [PortfolioUrl] nvarchar(max) NULL;

ALTER TABLE [Students] ADD [SecurityLog] nvarchar(max) NULL;

ALTER TABLE [Students] ADD [SuccessScore] int NOT NULL DEFAULT 0;

ALTER TABLE [Employers] ADD [Badges] nvarchar(max) NULL;

ALTER TABLE [Employers] ADD [IsVerified] bit NOT NULL DEFAULT CAST(0 AS bit);

CREATE TABLE [JobApplications] (
    [Id] int NOT NULL IDENTITY,
    [JobPostingId] int NOT NULL,
    [StudentId] int NULL,
    [ApplicantFullName] nvarchar(max) NOT NULL,
    [ApplicantEmail] nvarchar(max) NOT NULL,
    [ApplicantPhone] nvarchar(max) NULL,
    [ExperienceSummary] nvarchar(max) NULL,
    [Status] int NOT NULL,
    [AppliedAt] datetime2 NOT NULL,
    [StudentSignatureData] nvarchar(max) NULL,
    [EmployerStampData] nvarchar(max) NULL,
    [AdminStampData] nvarchar(max) NULL,
    [PdfReportPath] nvarchar(max) NULL,
    CONSTRAINT [PK_JobApplications] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_JobApplications_JobPostings_JobPostingId] FOREIGN KEY ([JobPostingId]) REFERENCES [JobPostings] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_JobApplications_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id])
);

IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CategoryId', N'CourseName', N'Curriculum', N'DeletedAt', N'DeletedBy', N'Description', N'DurationHours', N'EndDate', N'EndTime', N'ExamDate', N'ImageUrl', N'IsActive', N'IsDeleted', N'IsLive', N'LearningOutcomes', N'LiveRoomId', N'MaxAbsenceLimit', N'Price', N'Quota', N'Requirements', N'StartDate', N'StartTime', N'WeeklySyllabus', N'WhoIsItFor') AND [object_id] = OBJECT_ID(N'[Courses]'))
    SET IDENTITY_INSERT [Courses] ON;
INSERT INTO [Courses] ([Id], [CategoryId], [CourseName], [Curriculum], [DeletedAt], [DeletedBy], [Description], [DurationHours], [EndDate], [EndTime], [ExamDate], [ImageUrl], [IsActive], [IsDeleted], [IsLive], [LearningOutcomes], [LiveRoomId], [MaxAbsenceLimit], [Price], [Quota], [Requirements], [StartDate], [StartTime], [WeeklySyllabus], [WhoIsItFor])
VALUES (17, 8, N'Profesyonel Arıcılık ve Bal Üretimi', N'', NULL, NULL, N'', 40, '2026-06-30T00:00:00.0000000', '12:00:00', NULL, N'https://images.unsplash.com/photo-1587334206571-3390ccc205df?w=600', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'', NULL, 4, 300.0, 30, N'Temel bilgisayar kullanımı.', '2026-05-20T00:00:00.0000000', '09:00:00', CONCAT(CAST(N'Pazartesi: 09:00-12:00' AS nvarchar(max)), nchar(10), N'Salı: 09:00-12:00', nchar(10), N'Çarşamba: 09:00-12:00'), N'Kendini geliştirmek isteyen herkes.'),
(18, 8, N'Modern Seralarda Organik Tarım', N'', NULL, NULL, N'', 60, '2026-07-25T00:00:00.0000000', '12:00:00', NULL, N'https://images.unsplash.com/photo-1592419044706-39796d40f98c?w=600', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'', NULL, 4, 450.0, 25, N'Temel bilgisayar kullanımı.', '2026-05-25T00:00:00.0000000', '09:00:00', CONCAT(CAST(N'Pazartesi: 09:00-12:00' AS nvarchar(max)), nchar(10), N'Salı: 09:00-12:00', nchar(10), N'Çarşamba: 09:00-12:00'), N'Kendini geliştirmek isteyen herkes.');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CategoryId', N'CourseName', N'Curriculum', N'DeletedAt', N'DeletedBy', N'Description', N'DurationHours', N'EndDate', N'EndTime', N'ExamDate', N'ImageUrl', N'IsActive', N'IsDeleted', N'IsLive', N'LearningOutcomes', N'LiveRoomId', N'MaxAbsenceLimit', N'Price', N'Quota', N'Requirements', N'StartDate', N'StartTime', N'WeeklySyllabus', N'WhoIsItFor') AND [object_id] = OBJECT_ID(N'[Courses]'))
    SET IDENTITY_INSERT [Courses] OFF;

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T01:50:03.6114984+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T01:50:03.6116960+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T01:50:03.6116965+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T01:50:03.6116969+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T01:50:03.6116972+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T01:50:03.6117000+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-09T01:50:03.6133578+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-11T01:50:03.6133806+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6110531+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111540+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111568+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111571+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111573+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111575+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111576+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111689+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111691+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111693+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111694+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T01:50:03.6111696+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-02T01:50:03.6135579+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-07T01:50:03.6135990+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-10T01:50:03.6135993+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-07T01:50:03.6131010+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-08T01:50:03.6131288+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T01:50:03.6136797+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T01:50:03.6138598+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T01:50:03.6138602+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T01:50:03.6138605+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T01:50:03.6138607+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T01:50:03.6144262+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T01:50:03.6144729+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T01:50:03.6144736+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Students] SET [Badges] = NULL, [EloRating] = 1200, [IsAvailableForWork] = CAST(1 AS bit), [IsSpotlight] = CAST(0 AS bit), [IsVerified] = CAST(0 AS bit), [PortfolioUrl] = NULL, [SecurityLog] = NULL, [SuccessScore] = 0
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


CREATE INDEX [IX_JobApplications_JobPostingId] ON [JobApplications] ([JobPostingId]);

CREATE INDEX [IX_JobApplications_StudentId] ON [JobApplications] ([StudentId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260511225006_UpdateStudentTalentColumns', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T02:37:16.3093084+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T02:37:16.3096325+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T02:37:16.3096333+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T02:37:16.3096337+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T02:37:16.3096439+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T02:37:16.3096482+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-09T02:37:16.3124129+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-11T02:37:16.3124488+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3082726+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084859+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084922+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084926+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084929+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084933+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084936+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084939+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084942+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084945+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084949+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T02:37:16.3084952+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-02T02:37:16.3127378+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-07T02:37:16.3128050+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-10T02:37:16.3128060+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-07T02:37:16.3120244+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-08T02:37:16.3120797+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T02:37:16.3129787+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T02:37:16.3132804+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T02:37:16.3132813+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T02:37:16.3132817+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T02:37:16.3132820+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T02:37:16.3139041+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T02:37:16.3139386+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T02:37:16.3139390+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260511233719_FixJobPostingCreatedAt', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [Address] nvarchar(max) NULL;

DECLARE @var4 nvarchar(max);
SELECT @var4 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[MasterTrainerApplications]') AND [c].[name] = N'Address');
IF @var4 IS NOT NULL EXEC(N'ALTER TABLE [MasterTrainerApplications] DROP CONSTRAINT ' + @var4 + ';');
UPDATE [MasterTrainerApplications] SET [Address] = N'' WHERE [Address] IS NULL;
ALTER TABLE [MasterTrainerApplications] ALTER COLUMN [Address] nvarchar(max) NOT NULL;
ALTER TABLE [MasterTrainerApplications] ADD DEFAULT N'' FOR [Address];

ALTER TABLE [MasterTrainerApplications] ADD [PhotoPath] nvarchar(max) NOT NULL DEFAULT N'';

ALTER TABLE [Instructors] ADD [Address] nvarchar(max) NULL;

ALTER TABLE [Instructors] ADD [BirthYear] int NULL;

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T12:49:02.9015699+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T12:49:02.9017730+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T12:49:02.9017735+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T12:49:02.9017739+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T12:49:02.9017742+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-12T12:49:02.9017770+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-09T12:49:02.9035224+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-11T12:49:02.9035557+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9011445+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012517+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012546+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012548+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012550+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012552+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012553+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012555+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012557+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012559+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012560+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-12T12:49:02.9012562+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-02T12:49:02.9038101+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-07T12:49:02.9038849+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-10T12:49:02.9038854+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL, [FullName] = N'Ahmet Yılmaz', [Password] = N'123', [Username] = N'ahmet'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = NULL, [BirthYear] = NULL
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-12T12:49:02.9052172+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-12T12:49:02.9054835+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-12T12:49:02.9054844+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-07T12:49:02.9032832+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-08T12:49:02.9033435+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T12:49:02.9040217+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T12:49:02.9042627+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T12:49:02.9042634+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T12:49:02.9042638+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-12T12:49:02.9042641+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T12:49:02.9050176+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T12:49:02.9050588+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-12T12:49:02.9050591+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Students] SET [Address] = NULL
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260512094909_AddInstructorAddressAndBirthYear', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
DECLARE @var5 nvarchar(max);
SELECT @var5 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[JobPostings]') AND [c].[name] = N'Title');
IF @var5 IS NOT NULL EXEC(N'ALTER TABLE [JobPostings] DROP CONSTRAINT ' + @var5 + ';');
ALTER TABLE [JobPostings] ALTER COLUMN [Title] nvarchar(max) NOT NULL;

ALTER TABLE [JobPostings] ADD [CompanyName] nvarchar(max) NOT NULL DEFAULT N'';

ALTER TABLE [JobPostings] ADD [ContactEmail] nvarchar(max) NULL;

ALTER TABLE [JobPostings] ADD [Deadline] datetime2 NULL;

ALTER TABLE [JobPostings] ADD [JobType] nvarchar(max) NULL;

ALTER TABLE [Applications] ADD [DiscountCode] nvarchar(max) NULL;

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-13T01:27:32.1951655+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-13T01:27:32.1954778+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-13T01:27:32.1954786+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-13T01:27:32.1954791+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-13T01:27:32.1954794+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-13T01:27:32.1954798+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-10T01:27:32.2005235+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-12T01:27:32.2005719+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1944530+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946492+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946505+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946509+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946511+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946515+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946517+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946562+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946565+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946568+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946571+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-13T01:27:32.1946574+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-03T01:27:32.2008584+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-08T01:27:32.2009266+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-11T01:27:32.2009272+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Address] = N'Borçka, Artvin', [BirthYear] = 1985, [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [IsApproved] = CAST(0 AS bit)
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CompanyName] = N'', [ContactEmail] = N'', [CreatedAt] = '2026-05-13T01:27:32.2025627+03:00', [Deadline] = NULL, [JobType] = N'Tam Zamanlı'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CompanyName] = N'', [ContactEmail] = N'', [CreatedAt] = '2026-05-13T01:27:32.2028794+03:00', [Deadline] = NULL, [JobType] = N'Tam Zamanlı'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CompanyName] = N'', [ContactEmail] = N'', [CreatedAt] = '2026-05-13T01:27:32.2028802+03:00', [Deadline] = NULL, [JobType] = N'Tam Zamanlı'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-08T01:27:32.2000882+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-09T01:27:32.2001541+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-13T01:27:32.2010509+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-13T01:27:32.2013567+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-13T01:27:32.2013574+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-13T01:27:32.2013578+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-13T01:27:32.2013582+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-13T01:27:32.2020416+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-13T01:27:32.2020798+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-13T01:27:32.2020803+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260512222735_AddMissingJobPostingColumnsV2', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
ALTER TABLE [Students] ADD [GithubUrl] nvarchar(max) NULL;

ALTER TABLE [Students] ADD [LinkedInUrl] nvarchar(max) NULL;

DECLARE @var6 nvarchar(max);
SELECT @var6 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Instructors]') AND [c].[name] = N'FullName');
IF @var6 IS NOT NULL EXEC(N'ALTER TABLE [Instructors] DROP CONSTRAINT ' + @var6 + ';');
ALTER TABLE [Instructors] ALTER COLUMN [FullName] nvarchar(450) NULL;

ALTER TABLE [Instructors] ADD [Bio] nvarchar(max) NULL;

ALTER TABLE [Instructors] ADD [DribbbleUrl] nvarchar(max) NULL;

ALTER TABLE [Instructors] ADD [Education] nvarchar(max) NULL;

ALTER TABLE [Instructors] ADD [LinkedInUrl] nvarchar(max) NULL;

ALTER TABLE [Instructors] ADD [PortfolioUrl] nvarchar(max) NULL;

ALTER TABLE [Instructors] ADD [Skills] nvarchar(max) NULL;

DECLARE @var7 nvarchar(max);
SELECT @var7 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Courses]') AND [c].[name] = N'CourseName');
IF @var7 IS NOT NULL EXEC(N'ALTER TABLE [Courses] DROP CONSTRAINT ' + @var7 + ';');
ALTER TABLE [Courses] ALTER COLUMN [CourseName] nvarchar(450) NOT NULL;

DECLARE @var8 nvarchar(max);
SELECT @var8 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[Applications]') AND [c].[name] = N'Email');
IF @var8 IS NOT NULL EXEC(N'ALTER TABLE [Applications] DROP CONSTRAINT ' + @var8 + ';');
ALTER TABLE [Applications] ALTER COLUMN [Email] nvarchar(450) NULL;

ALTER TABLE [Applications] ADD [PaymentType] nvarchar(max) NULL;

ALTER TABLE [Applications] ADD [UsedHalkPointCode] nvarchar(max) NULL;

CREATE TABLE [HalkPointActivities] (
    [Id] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [ActivityType] nvarchar(max) NULL,
    [PointAmount] int NOT NULL,
    [Date] datetime2 NOT NULL,
    CONSTRAINT [PK_HalkPointActivities] PRIMARY KEY ([Id])
);

CREATE TABLE [HalkPointCodes] (
    [Id] int NOT NULL IDENTITY,
    [UserId] int NOT NULL,
    [CourseId] int NOT NULL,
    [GeneratedCode] nvarchar(max) NULL,
    [IsUsed] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    CONSTRAINT [PK_HalkPointCodes] PRIMARY KEY ([Id])
);

CREATE TABLE [PromoCodes] (
    [Id] int NOT NULL IDENTITY,
    [Code] nvarchar(max) NOT NULL,
    [CourseId] int NOT NULL,
    [StudentId] int NOT NULL,
    [IsUsed] bit NOT NULL,
    [CreatedAt] datetime2 NOT NULL,
    [UsedAt] datetime2 NULL,
    [PointCost] int NOT NULL,
    CONSTRAINT [PK_PromoCodes] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_PromoCodes_Courses_CourseId] FOREIGN KEY ([CourseId]) REFERENCES [Courses] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_PromoCodes_Students_StudentId] FOREIGN KEY ([StudentId]) REFERENCES [Students] ([Id]) ON DELETE CASCADE
);

UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1526379095098-d400fd0bf935?w=600&fm=webp&fm=webp'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1547658719-da2b51169166?w=600&fm=webp&fm=webp'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=600&fm=webp&fm=webp'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1543109740-4bdb38fda756?w=600&fm=webp'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1527866959252-deab85ef7d1b?w=600&fm=webp'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1513364776144-60967b0f800f?w=600&fm=webp'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1565193566173-7a0ee3dbe261?w=600&fm=webp'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1510915361894-db8b60106cb1?w=600&fm=webp'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1507838153414-b4b713384a76?w=600&fm=webp'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=600&fm=webp'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1556910103-1c02745aae4d?w=600&fm=webp'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1578985545062-69928b1d9587?w=600&fm=webp'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1560750588-73207b1ef5b8?w=600&fm=webp'
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1554224155-8d04cb21cd6c?w=600&fm=webp'
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1559136555-9303baea8ebd?w=600&fm=webp'
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=600&fm=webp'
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1587334206571-3390ccc205df?w=600&fm=webp'
WHERE [Id] = 17;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [ImageUrl] = N'https://images.unsplash.com/photo-1592419044706-39796d40f98c?w=600&fm=webp'
WHERE [Id] = 18;
SELECT @@ROWCOUNT;


IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CategoryId', N'CourseName', N'Curriculum', N'DeletedAt', N'DeletedBy', N'Description', N'DurationHours', N'EndDate', N'EndTime', N'ExamDate', N'ImageUrl', N'IsActive', N'IsDeleted', N'IsLive', N'LearningOutcomes', N'LiveRoomId', N'MaxAbsenceLimit', N'Price', N'Quota', N'Requirements', N'StartDate', N'StartTime', N'WeeklySyllabus', N'WhoIsItFor') AND [object_id] = OBJECT_ID(N'[Courses]'))
    SET IDENTITY_INSERT [Courses] ON;
INSERT INTO [Courses] ([Id], [CategoryId], [CourseName], [Curriculum], [DeletedAt], [DeletedBy], [Description], [DurationHours], [EndDate], [EndTime], [ExamDate], [ImageUrl], [IsActive], [IsDeleted], [IsLive], [LearningOutcomes], [LiveRoomId], [MaxAbsenceLimit], [Price], [Quota], [Requirements], [StartDate], [StartTime], [WeeklySyllabus], [WhoIsItFor])
VALUES (19, 1, N'Unity ile Oyun Geliştirme', N'', NULL, NULL, N'2D ve 3D oyunlar yapmayı öğrenin. C# programlama ve Unity arayüzü.', 80, '2026-08-14T19:46:04.3926736+03:00', '12:00:00', NULL, N'https://images.unsplash.com/photo-1552824236-41102881ad24?w=600', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'', NULL, 4, 750.0, 20, N'Temel bilgisayar kullanımı.', '2026-06-13T19:46:04.3927295+03:00', '09:00:00', CONCAT(CAST(N'Pazartesi: 09:00-12:00' AS nvarchar(max)), nchar(10), N'Salı: 09:00-12:00', nchar(10), N'Çarşamba: 09:00-12:00'), N'Kendini geliştirmek isteyen herkes.'),
(20, 4, N'Piyano Eğitimi (Başlangıç)', N'', NULL, NULL, N'Nota okuma ve temel piyano teknikleri. Müziğin büyülü dünyasına adım atın.', 48, '2026-08-14T19:46:04.3927411+03:00', '12:00:00', NULL, N'https://images.unsplash.com/photo-1520529611442-eaf5f228497b?w=600', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'', NULL, 4, 750.0, 10, N'Temel bilgisayar kullanımı.', '2026-05-19T19:46:04.3927418+03:00', '09:00:00', CONCAT(CAST(N'Pazartesi: 09:00-12:00' AS nvarchar(max)), nchar(10), N'Salı: 09:00-12:00', nchar(10), N'Çarşamba: 09:00-12:00'), N'Kendini geliştirmek isteyen herkes.'),
(21, 1, N'Dijital Pazarlama ve SEO', N'', NULL, NULL, N'İşinizi dijital dünyada büyütmenin yollarını öğrenin. Google Ads, Meta Ads ve SEO teknikleri.', 40, '2026-08-14T19:46:04.3927428+03:00', '12:00:00', NULL, N'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=600', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'', NULL, 4, 500.0, 30, N'Temel bilgisayar kullanımı.', '2026-05-29T19:46:04.3927431+03:00', '09:00:00', CONCAT(CAST(N'Pazartesi: 09:00-12:00' AS nvarchar(max)), nchar(10), N'Salı: 09:00-12:00', nchar(10), N'Çarşamba: 09:00-12:00'), N'Kendini geliştirmek isteyen herkes.'),
(22, 1, N'Python ile Veri Analizi', N'', NULL, NULL, N'Pandas, Numpy ve Matplotlib kütüphaneleri ile veriden anlamlı sonuçlar çıkarın.', 60, '2026-08-14T19:46:04.3927436+03:00', '12:00:00', NULL, N'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=600', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'', NULL, 4, 600.0, 25, N'Temel bilgisayar kullanımı.', '2026-06-03T19:46:04.3927439+03:00', '09:00:00', CONCAT(CAST(N'Pazartesi: 09:00-12:00' AS nvarchar(max)), nchar(10), N'Salı: 09:00-12:00', nchar(10), N'Çarşamba: 09:00-12:00'), N'Kendini geliştirmek isteyen herkes.'),
(23, 3, N'Yaratıcı Yazarlık Atölyesi', N'', NULL, NULL, N'Kendi hikayenizi yazmaya başlayın. Karakter gelişimi ve kurgu teknikleri.', 24, '2026-08-14T19:46:04.3927470+03:00', '12:00:00', NULL, N'https://images.unsplash.com/photo-1455390582262-044cdead277a?w=600', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'', NULL, 4, 400.0, 15, N'Temel bilgisayar kullanımı.', '2026-05-24T19:46:04.3927473+03:00', '09:00:00', CONCAT(CAST(N'Pazartesi: 09:00-12:00' AS nvarchar(max)), nchar(10), N'Salı: 09:00-12:00', nchar(10), N'Çarşamba: 09:00-12:00'), N'Kendini geliştirmek isteyen herkes.'),
(24, 3, N'Temel Fotoğrafçılık', N'', NULL, NULL, N'Işık, kompozisyon ve teknik ayarlar. Makinenizi tanıyın ve harika kareler yakalayın.', 32, '2026-08-14T19:46:04.3927478+03:00', '12:00:00', NULL, N'https://images.unsplash.com/photo-1452784444945-3f422708fe5e?w=600', CAST(1 AS bit), CAST(0 AS bit), CAST(0 AS bit), N'', NULL, 4, 450.0, 20, N'Temel bilgisayar kullanımı.', '2026-06-08T19:46:04.3927481+03:00', '09:00:00', CONCAT(CAST(N'Pazartesi: 09:00-12:00' AS nvarchar(max)), nchar(10), N'Salı: 09:00-12:00', nchar(10), N'Çarşamba: 09:00-12:00'), N'Kendini geliştirmek isteyen herkes.');
IF EXISTS (SELECT * FROM [sys].[identity_columns] WHERE [name] IN (N'Id', N'CategoryId', N'CourseName', N'Curriculum', N'DeletedAt', N'DeletedBy', N'Description', N'DurationHours', N'EndDate', N'EndTime', N'ExamDate', N'ImageUrl', N'IsActive', N'IsDeleted', N'IsLive', N'LearningOutcomes', N'LiveRoomId', N'MaxAbsenceLimit', N'Price', N'Quota', N'Requirements', N'StartDate', N'StartTime', N'WeeklySyllabus', N'WhoIsItFor') AND [object_id] = OBJECT_ID(N'[Courses]'))
    SET IDENTITY_INSERT [Courses] OFF;

UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:46:04.4003075+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:46:04.4010760+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:46:04.4010794+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:46:04.4011028+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:46:04.4011037+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:46:04.4011043+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-11T19:46:04.4130065+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-13T19:46:04.4130731+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3971202+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973480+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973494+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973499+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973503+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973507+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973606+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973611+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973616+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973620+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973625+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:46:04.3973630+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-04T19:46:04.4137245+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-09T19:46:04.4138534+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-12T19:46:04.4138543+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'10 yılı aşkın süredir sektörde aktif olarak UI/UX tasarım ve ön yüz geliştirme projelerinde yer almaktadır. Figma, Adobe Creative Cloud ve modern web teknolojileri (HTML5, CSS3, JavaScript) konusunda uzmanlaşmıştır. Öğrencilerine sadece teknik bilgi değil, aynı zamanda tasarım odaklı düşünme yetisini de kazandırmayı amaçlar.', [DribbbleUrl] = N'https://behance.net/elifkaya', [Education] = CONCAT(CAST(N'İstanbul Teknik Üniversitesi - Endüstriyel Tasarım (Lisans)' AS nvarchar(max)), nchar(10), N'Marmara Üniversitesi - Grafik Tasarım (Yüksek Lisans)'), [ImageUrl] = N'/img/instructors/elif_kaya.png', [LinkedInUrl] = N'https://linkedin.com/in/elifkaya', [PortfolioUrl] = N'https://elifkaya.design', [Skills] = N'UI/UX Design, Figma, HTML/CSS, Responsive Design, Adobe XD, Prototyping'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Halk Eğitim bünyesinde uzman eğitmen olarak görev yapmaktadır.', [DribbbleUrl] = NULL, [Education] = NULL, [LinkedInUrl] = NULL, [PortfolioUrl] = NULL, [Skills] = NULL
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T19:46:04.4186656+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T19:46:04.4191699+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T19:46:04.4191711+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-09T19:46:04.4123363+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-10T19:46:04.4124175+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:46:04.4146614+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:46:04.4160919+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:46:04.4160960+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:46:04.4160969+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:46:04.4160975+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T19:46:04.4181672+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T19:46:04.4182423+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T19:46:04.4182430+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Students] SET [GithubUrl] = NULL, [LinkedInUrl] = NULL
WHERE [Id] = 99;
SELECT @@ROWCOUNT;


CREATE INDEX [IX_Instructors_FullName] ON [Instructors] ([FullName]);

CREATE INDEX [IX_Courses_CourseName] ON [Courses] ([CourseName]);

CREATE INDEX [IX_Applications_Email] ON [Applications] ([Email]);

CREATE INDEX [IX_Applications_Status] ON [Applications] ([Status]);

CREATE INDEX [IX_PromoCodes_CourseId] ON [PromoCodes] ([CourseId]);

CREATE INDEX [IX_PromoCodes_StudentId] ON [PromoCodes] ([StudentId]);

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260514164615_AddInstructorDetails', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
UPDATE [Courses] SET [EndDate] = '2026-08-14T19:48:41.1740534+03:00', [StartDate] = '2026-06-13T19:48:41.1741160+03:00'
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T19:48:41.1741317+03:00', [StartDate] = '2026-05-19T19:48:41.1741321+03:00'
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T19:48:41.1741329+03:00', [StartDate] = '2026-05-29T19:48:41.1741331+03:00'
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T19:48:41.1741335+03:00', [StartDate] = '2026-06-03T19:48:41.1741338+03:00'
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T19:48:41.1741341+03:00', [StartDate] = '2026-05-24T19:48:41.1741344+03:00'
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T19:48:41.1741348+03:00', [StartDate] = '2026-06-08T19:48:41.1741350+03:00'
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:48:41.1856282+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:48:41.1863480+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:48:41.1863495+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:48:41.1863500+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:48:41.1863505+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T19:48:41.1863509+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-11T19:48:41.2017932+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-13T19:48:41.2018733+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1788775+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796606+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796662+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796668+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796671+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796675+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796679+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796683+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796687+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796691+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796694+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T19:48:41.1796696+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-04T19:48:41.2026692+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-09T19:48:41.2029948+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-12T19:48:41.2029957+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T19:48:41.2062921+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T19:48:41.2079033+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T19:48:41.2079077+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-09T19:48:41.1997983+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-10T19:48:41.2003438+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:48:41.2034746+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:48:41.2040398+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:48:41.2040411+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:48:41.2040416+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T19:48:41.2040420+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T19:48:41.2057145+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T19:48:41.2057948+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T19:48:41.2057953+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260514164857_AddInstructorDetailsFinal', N'10.0.4');

COMMIT;
GO

BEGIN TRANSACTION;
UPDATE [Courses] SET [EndDate] = '2026-08-14T21:44:00.9289677+03:00', [StartDate] = '2026-06-13T21:44:00.9289926+03:00'
WHERE [Id] = 19;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T21:44:00.9289969+03:00', [StartDate] = '2026-05-19T21:44:00.9289971+03:00'
WHERE [Id] = 20;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T21:44:00.9289976+03:00', [StartDate] = '2026-05-29T21:44:00.9289978+03:00'
WHERE [Id] = 21;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T21:44:00.9289980+03:00', [StartDate] = '2026-06-03T21:44:00.9289982+03:00'
WHERE [Id] = 22;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T21:44:00.9289984+03:00', [StartDate] = '2026-05-24T21:44:00.9289986+03:00'
WHERE [Id] = 23;
SELECT @@ROWCOUNT;


UPDATE [Courses] SET [EndDate] = '2026-08-14T21:44:00.9289988+03:00', [StartDate] = '2026-06-08T21:44:00.9289990+03:00'
WHERE [Id] = 24;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T21:44:00.9306008+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T21:44:00.9307993+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T21:44:00.9307998+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T21:44:00.9308075+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T21:44:00.9308078+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [ExhibitionItems] SET [CreatedAt] = '2026-05-14T21:44:00.9308081+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-11T21:44:00.9333442+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryComments] SET [CreatedAt] = '2026-05-13T21:44:00.9333683+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9301394+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302779+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302788+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302790+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302792+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302794+03:00'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302796+03:00'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302797+03:00'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302799+03:00'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302801+03:00'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302802+03:00'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [GalleryItems] SET [CreatedAt] = '2026-05-14T21:44:00.9302804+03:00'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-04T21:44:00.9335694+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-09T21:44:00.9336144+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Ideas] SET [CreatedAt] = '2026-05-12T21:44:00.9336147+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Yazılım dünyasına 15 yıl önce adım atan Ahmet Yılmaz, yapay zeka ve Python programlama konusunda ulusal çapta birçok ödüle sahiptir. Gençleri geleceğin teknolojileriyle buluşturmayı misyon edinmiştir.', [Education] = CONCAT(CAST(N'ODTÜ - Bilgisayar Mühendisliği (Lisans)' AS nvarchar(max)), nchar(10), N'Boğaziçi Üniversitesi - Yapay Zeka (Yüksek Lisans)'), [Skills] = N'Python, Makine Öğrenmesi, Veri Bilimi, C#, Eğitim Teknolojileri'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'10 yılı aşkın süredir sektörde aktif olarak UI/UX tasarım ve ön yüz geliştirme projelerinde yer almaktadır. Figma, Adobe Creative Cloud ve modern web teknolojileri konusunda uzmanlaşmıştır.', [DribbbleUrl] = NULL, [Skills] = N'UI/UX Design, Figma, HTML/CSS, Responsive Design, Adobe XD'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Kamu kurumları ve özel sektörde 20 yıllık sistem yöneticiliği tecrübesine sahip olan Mehmet Demir, ofis yazılımları ve temel bilgisayar ağları konusunda yüzlerce kursiyer mezun etmiştir.', [Education] = N'Karadeniz Teknik Üniversitesi - Bilgisayar Teknolojileri', [Skills] = N'Windows Server, Microsoft Office, Ağ Güvenliği, Donanım'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Ana dili İngilizce olan Sarah, CELTA ve TEFL sertifikalarına sahiptir. 8 yıldır Türkiye''de her yaş grubuna yenilikçi metotlarla İngilizce konuşma ve yazma eğitimleri vermektedir.', [Education] = CONCAT(CAST(N'University of London - English Literature' AS nvarchar(max)), nchar(10), N'Cambridge CELTA Certification'), [Skills] = N'İngilizce (Anadil), Konuşma Pratiği, IELTS/TOEFL Hazırlık, Pedagoji'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Goethe Enstitüsü geçmişine sahip olan Hans, Almanca dilinin mantığını ve Alman kültürünü kursiyerlere interaktif bir şekilde aktararak dil öğrenimini keyifli hale getiriyor.', [Education] = N'Ludwig-Maximilians-Universität München - Germanistik', [Skills] = N'Almanca A1-C1, Telc Sınav Hazırlığı, Kültürel Entegrasyon'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Kültür Bakanlığı onaylı El Sanatları ustası olan Zeynep Hanım, ahşap boyama ve geleneksel Türk motifleri üzerine eserler üretmekte ve sergiler açmaktadır.', [Education] = N'Mimar Sinan Güzel Sanatlar Üniversitesi - Geleneksel Türk Sanatları', [Skills] = N'Ahşap Boyama, Ebru Sanatı, Hat Sanatı, Motif Tasarımı'
WHERE [Id] = 6;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Toprağa şekil vermeyi hayat felsefesi olarak gören Fatma Çelik, modern ve geleneksel seramik sanatını harmanlayarak atölyesinde eşsiz eserler ortaya çıkarıyor.', [Education] = N'Hacettepe Üniversitesi - Seramik ve Cam Bölümü', [Skills] = N'Seramik Şekillendirme, Sırlama Teknikleri, Çini İşlemeciliği'
WHERE [Id] = 7;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Klasik gitar ve piyano alanında konservatuar eğitimi almış olan Can Özkan, çok sesli korolarda şeflik yapmış ve sayısız müzisyen yetiştirmiştir.', [Education] = N'Ankara Devlet Konservatuarı - Müzik Teorisi ve Kompozisyon', [Skills] = N'Klasik Gitar, Piyano, Solfej, Armoni'
WHERE [Id] = 8;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Anadolu''nun ezgilerini nesilden nesile aktarmayı görev edinen Hasan Korkmaz, bağlama virtüözü olup yurt içi ve yurt dışı birçok festivalde sahne almıştır.', [Education] = N'Ege Üniversitesi - Türk Musikisi Devlet Konservatuarı', [Skills] = N'Bağlama, Türk Halk Müziği Repertuarı, Şan Eğitimi'
WHERE [Id] = 9;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Hindistan''da aldığı 500 saatlik Yoga Alliance eğitiminin ardından, beden ve zihin sağlığını geliştirmeye yönelik nefes terapileri ve Hatha Yoga dersleri vermektedir.', [Education] = CONCAT(CAST(N'Rishikesh Yoga Academy (RYT 500)' AS nvarchar(max)), nchar(10), N'Spor Bilimleri Fakültesi'), [Skills] = N'Hatha Yoga, Nefes Terapisi, Meditasyon, Anatomi'
WHERE [Id] = 10;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Uluslararası mutfaklarda 25 yıllık şeflik deneyimi olan Mustafa Bey, Michelin yıldızlı restoranlardaki tecrübesini yerel Türk mutfağıyla birleştirerek eşsiz tarifler öğretiyor.', [Education] = CONCAT(CAST(N'Le Cordon Bleu Paris - Culinary Arts' AS nvarchar(max)), nchar(10), N'Mengen Aşçılık Meslek Lisesi'), [Skills] = N'Dünya Mutfağı, Türk Mutfağı, Menü Planlama, Mutfak Yönetimi'
WHERE [Id] = 11;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Butik pastacılık ve çikolata tasarımında kendi markasını kurmuş olan Pınar Aydın, görsel şölene dönüşen tatlıların tüm sırlarını öğrencileriyle paylaşıyor.', [Education] = N'Gastronomi ve Mutfak Sanatları Lisans Eğitimi', [Skills] = N'Butik Pasta Tasarımı, Çikolata Yapımı, Fransız Tatlıları'
WHERE [Id] = 12;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Medikal estetik ve cilt bakımı uzmanı Derya Şahin, en yeni güzellik teknolojileri ve dermatolojik testlerden geçmiş doğal yöntemlerle sektörde profesyoneller yetiştiriyor.', [Education] = N'Güzellik ve Saç Bakım Hizmetleri Uzmanlık Eğitimi', [Skills] = N'Cilt Bakımı, Lazer Epilasyon, Profesyonel Makyaj, Anatomi'
WHERE [Id] = 13;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Kurumsal şirketlerde finans direktörlüğü yapmış olan Burak Öztürk, e-ticaret muhasebesi, vergi mevzuatı ve finansal okuryazarlık alanlarında danışmanlık yapmaktadır.', [Education] = CONCAT(CAST(N'Gazi Üniversitesi - İşletme' AS nvarchar(max)), nchar(10), N'SMMM Ruhsatı'), [Skills] = N'Genel Muhasebe, Finansal Analiz, E-Ticaret Vergilendirme, Excel'
WHERE [Id] = 14;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Sayısız start-up''a mentörlük yapan Prof. Dr. Selin Aktaş, melek yatırımcı ağlarıyla olan bağlantıları ve inovasyon stratejileri sayesinde girişimcilere yol gösteriyor.', [Education] = N'Stanford University - Business Administration (Ph.D.)', [Skills] = N'İş Geliştirme, Melek Yatırım, KOSGEB Danışmanlığı, Start-up Yönetimi'
WHERE [Id] = 15;
SELECT @@ROWCOUNT;


UPDATE [Instructors] SET [Bio] = N'Siber güvenlik alanında CEH ve CISSP sertifikalarına sahip Caner Kandemir, kurumların ağ güvenlik mimarilerini test eden etik bir hacker ve güvenlik araştırmacısıdır.', [Education] = CONCAT(CAST(N'Bilkent Üniversitesi - Bilgisayar Mühendisliği' AS nvarchar(max)), nchar(10), N'Certified Ethical Hacker (CEH)'), [Skills] = N'Ağ Güvenliği, Penetrasyon Testleri, Kriptografi, Sızma Testi'
WHERE [Id] = 16;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T21:44:00.9345491+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T21:44:00.9346961+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [JobPostings] SET [CreatedAt] = '2026-05-14T21:44:00.9346964+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-09T21:44:00.9331362+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [NewsComments] SET [CreatedAt] = '2026-05-10T21:44:00.9331610+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T21:44:00.9337230+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T21:44:00.9340288+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T21:44:00.9340298+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T21:44:00.9340301+03:00'
WHERE [Id] = 4;
SELECT @@ROWCOUNT;


UPDATE [QuizQuestions] SET [CreatedAt] = '2026-05-14T21:44:00.9340304+03:00'
WHERE [Id] = 5;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T21:44:00.9344609+03:00'
WHERE [Id] = 1;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T21:44:00.9344794+03:00'
WHERE [Id] = 2;
SELECT @@ROWCOUNT;


UPDATE [SiteSettings] SET [LastUpdated] = '2026-05-14T21:44:00.9344796+03:00'
WHERE [Id] = 3;
SELECT @@ROWCOUNT;


INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260514184404_UpdateInstructorBios', N'10.0.4');

COMMIT;
GO

