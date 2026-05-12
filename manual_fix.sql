ALTER TABLE [LibraryBooks] ADD [CourseId] int NULL;
ALTER TABLE [LibraryBooks] ADD [IsCourseNote] bit NOT NULL DEFAULT 0;
ALTER TABLE [LibraryBooks] ADD [StarCount] int NOT NULL DEFAULT 0;
ALTER TABLE [LibraryBooks] ADD [StudentId] int NULL;
ALTER TABLE [ExhibitionItems] ADD [StudentId] int NULL;
GO
INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20260507165334_AddStudentRelationsAndCourseNotes', N'10.0.4');
GO
