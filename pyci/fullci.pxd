# cython : language_level=3, boundscheck=False, wraparound=False, initializedcheck=False

# This file is part of PyCI.
#
# PyCI is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# PyCI is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License
# for more details.
#
# You should have received a copy of the GNU General Public License
# along with PyCI. If not, see <http://www.gnu.org/licenses/>.

r"""
PyCI Cython header.

"""

from libc.stdint cimport int64_t, uint64_t


__all__ = [
    'FullCIWfn',
    ]


ctypedef int64_t int_t


ctypedef uint64_t uint_t


cdef extern from 'pyci/fullci.h' namespace 'pyci':

    cdef cppclass FullCIWfn:
        int_t nword, nbasis, nocc_up, nocc_dn, nvir_up, nvir_dn, ndet, maxdet_up, maxdet_dn
        FullCIWfn()
        FullCIWfn(const int_t, const int_t, const int_t) except +
        FullCIWfn(const char *) except +
        void init(const int_t, const int_t, const int_t) except +
        void from_file(const char *) except +
        void to_file(const char *) except +
        int_t index_det(const uint_t *)
        void copy_det(const int_t, uint_t *)
        int_t add_det(const uint_t *) except +
        int_t add_det_from_occs(const int_t *, const int_t *) except +
        void add_all_dets() except +
        void add_excited_dets(const uint_t *, const int_t, const int_t) except +
        void reserve(const int_t) except +
        void squeeze()
