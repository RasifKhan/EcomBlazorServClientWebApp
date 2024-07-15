using AutoMapper;
using Ecommerce_Business.Repository.IRepository;
using Ecommerce_DataAccess;
using Ecommerce_DataAccess.Data;
using Ecommerce_Model;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce_Business.Repository
{
    public class CategoryRepository : ICategoryRepository
    {
        private readonly ApplicationDbContext _db;
        private readonly IMapper _mapper;
        public CategoryRepository(ApplicationDbContext db,IMapper mapper)
        {
            _db = db;
            _mapper = mapper;
        }
        public async Task<CategoryDTO> Create(CategoryDTO objDTO)
        {
            var obj=_mapper.Map<CategoryDTO,Category>(objDTO);
            var addedObj=_db.Categories.Add(obj);
            obj.CreateDate = DateTime.Now;
            await _db.SaveChangesAsync();
            return _mapper.Map<Category, CategoryDTO>(addedObj.Entity);
        } 
        public async Task <int> Delete(int Id)
        {
            var obj = await _db.Categories.FirstOrDefaultAsync(u => u.Id ==Id);
            if (obj != null)
            {
                _db.Categories.Remove(obj);
                return await _db.SaveChangesAsync();
            }
            return 0;
        }


        //Delete by using StoreProcedure ****************************************
        //public Task<int> DeleteFromSP(int Id)
        //{
        //    throw new NotImplementedException();
        //}

        //[HttpGet("hitpoints/{CharId}/{hitpoints}")]
        //public async Task<ActionResult<List<int>>> UpdateCharactersSP(int CharId, int hitpoints)
        //{
        //    var result = await _context.Database
        //        .ExecuteSqlRawAsync($"UpdateCharacterHitPoints {CharId},{hitpoints}");
        //    return Ok(result);
        //}

        public async Task<int> DeleteFromSP(int Id)
        {
            var result = await _db.Database
                .ExecuteSqlRawAsync($"SP_DeleteCategory {Id}");
             return result;
        }


        //************************************************************************
        public async Task<CategoryDTO> Get(int id)
        {
            var obj = await _db.Categories.FirstOrDefaultAsync(u => u.Id == id);
            if (obj != null)
            {
                return _mapper.Map<Category, CategoryDTO>(obj);
            }
            return new CategoryDTO();
        }
        public async Task<IEnumerable<CategoryDTO>> GetAll()
        {
            return  _mapper.Map<IEnumerable<Category>, IEnumerable<CategoryDTO>>(_db.Categories);
        }

        public async Task<CategoryDTO> Update(CategoryDTO objDTO)
        {
            var objFromDb = await _db.Categories.FirstOrDefaultAsync(u => u.Id == objDTO.Id);
            if (objFromDb != null)
            {
                objFromDb.Name = objDTO.Name;
                _db.Categories.Update(objFromDb);
                await _db.SaveChangesAsync();
                return _mapper.Map<Category, CategoryDTO>(objFromDb);
            }
            return objDTO;
        }
    }
}
