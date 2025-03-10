﻿using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using UTube_Backend.Data;
var builder = WebApplication.CreateBuilder(args);
builder.Services.AddDbContext<UTube_BackendContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("UTube_BackendContext") ?? throw new InvalidOperationException("Connection string 'UTube_BackendContext' not found.")));

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();
app.UseCors(x => x
                 .AllowAnyMethod()
                 .AllowAnyHeader()
                 .SetIsOriginAllowed(origin => true) // allow any origin
                                                     //.WithOrigins("https://localhost:44351")); // Allow only this origin can also have multiple origins separated with comma
                 .AllowCredentials()); // allow credentials


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
