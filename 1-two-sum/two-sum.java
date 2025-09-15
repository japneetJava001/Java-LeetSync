class Solution {
    public int[] twoSum(int[] nums, int target) {
        for(int i = 0; i < nums.length; i++){
            int comp = target - nums[i];
            for(int j = i + 1; j < nums.length; j++){
                if(nums[j] == comp){
                    return new int[] {i, j};
                }
            }
        }
        return new int[] {};
    }
}