using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using UTube_Backend.Models;

namespace UTube_Backend.Data
{
    public class UTube_BackendContext : DbContext
    {
        public UTube_BackendContext (DbContextOptions<UTube_BackendContext> options)
            : base(options)
        {
        }

        public DbSet<UTube_Backend.Models.Video> Video { get; set; } = default!;

        public DbSet<UTube_Backend.Models.Category> Category { get; set; } = default!;
    }
}
