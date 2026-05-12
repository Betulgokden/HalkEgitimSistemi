BEGIN TRANSACTION;
ALTER TABLE [TeacherChatMessages] DROP CONSTRAINT [FK_TeacherChatMessages_Instructors_InstructorId];

DECLARE @var nvarchar(max);
SELECT @var = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[News]') AND [c].[name] = N'ViewCount');
IF @var IS NOT NULL EXEC(N'ALTER TABLE [News] DROP CONSTRAINT ' + @var + ';');
ALTER TABLE [News] DROP COLUMN [ViewCount];

DECLARE @var1 nvarchar(max);
SELECT @var1 = QUOTENAME([d].[name])
FROM [sys].[default_constraints] [d]
INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
WHERE ([d].[parent_object_id] = OBJECT_ID(N'[TeacherChatMessages]') AND [c].[name] = N'InstructorId');
IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [TeacherChatMessages] DROP CONSTRAINT ' + @var1 + ';');
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

