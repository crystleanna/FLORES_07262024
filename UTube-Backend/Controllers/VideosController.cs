using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using UTube_Backend.Data;
using UTube_Backend.Models;

namespace UTube_Backend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VideosController : ControllerBase
    {
        private readonly UTube_BackendContext _context;

        public VideosController(UTube_BackendContext context)
        {
            _context = context;
        }

        // GET: api/Videos
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Video>>> GetVideo()
        {
          if (_context.Video == null)
          {
              return NotFound();
          }
            return await _context.Video.ToListAsync();
        }

        // GET: api/Videos/5
        [HttpGet("{id:int}")]
        public async Task<ActionResult> GetVideo(int id)
        {
            if (_context.Video == null)
            {
                return NotFound();
            }
            var video = await _context.Video.FindAsync(id);

            if (video == null)
            {
                return NotFound();
            }

            var fileBytes = System.IO.File.ReadAllBytes(video.url);


            var extension = Path.GetExtension(video.url);
            return File(fileBytes, "application/octet-stream", video.title + extension);

        }

        // POST: api/Videos
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Video>> PostVideo(VideoPayload payload)
        {
            if (_context.Video == null)
            {
                return Problem("Entity set 'UTube_BackendContext.Video'  is null.");
            }

            var directory = Directory.GetCurrentDirectory();
            var extension = Path.GetExtension(payload.fileName);
            var path = Path.Combine(directory, DateTime.UtcNow.ToString("MMddyyyyhhmmss") + extension);

            var file = Convert.FromBase64String(payload.file);
            System.IO.File.WriteAllBytes(path, file);

            var video = new Video();
            video.title = payload.title;
            video.description = payload.description;
            video.thumbnail = "";
            video.url = path;
            video.category = payload.category;
            video.uploadedDate = DateTime.UtcNow;

            var newVideo = _context.Video.Add(video);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                throw;
            }

            return CreatedAtAction("GetVideo", new { id = video.id }, video);
        }

        private bool VideoExists(int id)
        {
            return (_context.Video?.Any(e => e.id == id)).GetValueOrDefault();
        }
    }
}
